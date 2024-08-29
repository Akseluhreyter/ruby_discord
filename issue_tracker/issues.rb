require 'net/http'
require 'time'

require 'nokogiri'
require 'reverse_markdown'
require 'discord_webhook/dsl'

########################################################################
# PART 0: Define Markdown converters
########################################################################
module ReverseMarkdown
  module Converters
    class Hr
      def convert(node, state = {})
        "\n\_\_\_\n"
      end
    end

    class A
      def convert(node, state = {})
        name  = treat_children(node, state)
        href  = node['href'] || ""
        title = extract_title(node)

        return name if href.empty? || name.empty?

        # Sometimes raw links are clickable, to keep this behavior,
        # we must share only the link or discord's scam avoidance
        # feature will show the [name](link) in its ugly, raw form.
        if name.match? /^https:|^http:/
          name
        else
          link = "[#{name}](#{href}#{title})"
          link.prepend(' ') if prepend_space?(node)
          link
        end
      end
    end

    # ReverseMarkdown has a "`register_ns': no implicit conversion of true into String (TypeError)"
    # when github_flavored: true is used. So the following is a hack.
    # Lucky for us that we only care about Ruby
    class Pre < Base
      def convert(node, state = {})
        content = treat_children(node, state)
        "```ruby\n" << content.strip << "\n```"
      end
    end
  end
end
########################################################################
# PART 1: Fetch issues and find any new posts since we last made an update.
# If there are no new posts, we exit the script early in this part.
########################################################################
Issue = Struct.new(
  :id,
  :tracker,
  :status,
  :subject,
  :assignee,
  :updated,
  :added,
  :author,
  :author_url,
  :gravatar,
  :description,
  :history,
)

data = Net::HTTP.get(URI 'https://bugs.ruby-lang.org/issues?utf8=%E2%9C%93&set_filter=1&sort=updated_on%3Adesc%2Cid%3Adesc&f%5B%5D=status_id&op%5Bstatus_id%5D=ev&v%5Bstatus_id%5D%5B%5D=1&f%5B%5D=&c%5B%5D=project&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=subject&c%5B%5D=assigned_to&c%5B%5D=updated_on&group_by=')
html = Nokogiri::HTML(data)
last = DATA.read.chomp.then do |timestamp|
  if timestamp.empty?
    Time.now.strftime("%m/%d/%Y %I:%M %p")
  else
    Time.strptime(it, "%m/%d/%Y %I:%M %p")
  end
end

issues =
  html
    .xpath('//tr[contains(@id, "issue")]')
    .take_while { Time.strptime(_1.at_xpath('./td[@class="updated_on"]').text, "%m/%d/%Y %I:%M %p") > last }
    .reverse_each
    .map do |node|
      Issue.new(
        id:       node.at_xpath('./td[@class="id"]').text,
        tracker:  node.at_xpath('./td[@class="tracker"]').text,
        status:   node.at_xpath('./td[@class="status"]').text,
        subject:  node.at_xpath('./td[@class="subject"]').text,
        assignee: node.at_xpath('./td[@class="assigned_to"]').text,
        updated:  node.at_xpath('./td[@class="updated_on"]').text.then { Time.strptime(_1, "%m/%d/%Y %I:%M %p") },
      )
    end

exit if issues.empty?
###############################################################################
# PART 2: New issue information has been posted. Notes/comments on an issue are
# fetched and processed here
###############################################################################
Note = Struct.new(
  :id,
  :author,
  :author_url,
  :details,
  :gravatar,
  :journal,
  :updated,
)

def parse_details(html)
  ReverseMarkdown.convert(html.xpath './ul[@class="details"]')
end

def parse_journal(html, limit: 1000)
  description = ''

  wiki = html.at_xpath('./div[@class="wiki"]')

  return description if wiki.nil?

  wiki
    .children
    .each do |node|
      markdown = ReverseMarkdown.convert(node).chomp

      break if description.length + markdown.length > limit

      unless markdown.empty?
        description << "\n" << markdown
      end
    end

  description
end

# Further process the issue data and gather notes
issues.each do |issue|
  data = Net::HTTP.get(URI "https://bugs.ruby-lang.org/issues/#{issue.id}")
  html = Nokogiri::HTML(data)

  # Transform the page's href tags to complete links to use later with discord
  html.xpath("//*[@href]").each do |node|
    case node['href']
    when /^\// then node['href'] = "https://bugs.ruby-lang.org#{node['href']}"
    when /^#/  then node['href'] = "https://bugs.ruby-lang.org/issues/#{issue.id}#{node['href']}"
    end
  end

  # At this step it's possible to gather author info
  issue.gravatar    = html.at_xpath('//img[@class="gravatar" and contains(@title, "Author")]')['src']
  issue.added       = html.at_xpath('(//p[@class="author"]/a)[2]')['title'].then { Time.strptime(_1, "%m/%d/%Y %I:%M %p") }
  issue.author      = html.at_xpath('//p[@class="author"]/a[@class="user active"]').text
  issue.author_url  = html.at_xpath('//p[@class="author"]/a[@class="user active"]')['href']#.then { "https://bugs.ruby-lang.org#{_1}" }
  issue.description = html.at_xpath('//div[@class="description"]').then(&method(:parse_journal))

  # Notes processed here
  issue.history =
    html
      .xpath('//div[contains(@id, "note-")]')
     &.map do |node|
        if author = node.at_xpath('./h4[@class="note-header"]/a[@class="user active"]')
          Note.new(
            id:         node['id'],
            author:     author.text,
            author_url: author['href'],
            details:    parse_details(node),
            gravatar:   node.at_xpath('./h4[@class="note-header"]/img[@class="gravatar"]')['src'],
            journal:    parse_journal(node),
            updated:    node.at_xpath('(./h4[@class="note-header"]/a)[2]')['title'].then { Time.strptime(_1, "%m/%d/%Y %I:%M %p") },
          )
        else
          Note.new(
            id:         node['id'],
            author:     'Anonymous',
           #author_url: 'https://bugs.ruby-lang.org',
            details:    parse_details(node),
            gravatar:   'https://bugs.ruby-lang.org/images/anonymous.png?1708914059',
            journal:    parse_journal(node),
            updated:    node.at_xpath('(./h4[@class="note-header"]/a)')['title'].then { Time.strptime(_1, "%m/%d/%Y %I:%M %p") },
          )
        end
     end
end
########################################################################
# PART 3: Post issues to Ruby Discord's Issue Tracker channel
########################################################################
webhook = DiscordWebhook.new ENV['RUBY_DISCORD_ISSUE_TRACKER']

issues.each do |post|
  webhook.post do
    embed title: "##{post.id} | #{post.tracker} | #{post.subject}" do
      color is: 0x8A4040 and url is: "https://bugs.ruby-lang.org/issues/#{post.id}"

      author name: post.author,
              url: post.author_url,
         icon_url: post.gravatar

      description is: post.description

      footer text: "Issue added: #{post.added.utc}"
    end
  end if post.added > last

  sleep 0.5

  post.history.each do |note|
    webhook.post do
      embed title: "##{post.id} | #{post.tracker} | #{post.subject}" do
        color is: 0x8A4040 and url is: "https://bugs.ruby-lang.org/issues/#{post.id}##{note.id}"

        author name: note.author,
                url: note.author_url,
           icon_url: note.gravatar

        # One or both of these should always be present
        field name: "Property Changes", value: note.details unless note.details.empty?
        field name: "Notes",            value: note.journal unless note.journal.empty?
        
        footer text: "Last updated: #{note.updated.utc}"
      end 
    end if note.updated > last

    sleep 0.5
  end
end

File
  .read(__FILE__)
  .split(/^__END__$/)
  .then do |script|
    File.open(__FILE__, 'w') do |f|
      f.puts(script.first)
      f.puts('__END__')
      f.puts(issues.last.updated.strftime "%m/%d/%Y %I:%M %p") 
    end
  end
__END__
08/25/2024 06:14 AM
