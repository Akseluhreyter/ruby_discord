require 'nokogiri'
require 'net/http'
require 'open-uri'
require 'discord_webhook'

require_relative '../utilities/markdown'

Post    = Struct.new(:title, :content, :link, :author)
webhook = DiscordWebhook.new(ENV['RUBY_DISCORD_RUBY_RELEASES'])
last    = DATA.read.chomp
html    = Nokogiri::HTML(URI.open 'https://www.ruby-lang.org/en/news')

html
  .xpath('//*[@class="post"]')
  .take_while { _1.at_xpath('h3/a').text != last }
  .reverse # so most recent is last
  .map do |data|
    Post.new(
      title:   data.at_xpath('h3/a').text,
      content: data.at_xpath('p[not(@class)]').then { ReverseMarkdown.convert it },
      link:    data.at_xpath('p[@class="post-link"]/a')['href'],
      author:  data.at_xpath('p[@class="post-info"]').text.match(/^Posted by (.*) (?=on)/i)[1], # I've never seen this field not be here.
    )
  end => posts

exit if posts.empty?

# Build the post requests
requests = posts.map do |post|
  thumbnail =
    case post.title
    when /Ruby .* Release/ then '1f389.png'
    when /CVE-\d+-\d+/     then '26a0.png'
    else                        '1f4e2.png'
    end

  {:content     => '<@&846844778934566922>',
   :attachments => [{:id => 0, :filename => thumbnail}],
   :files       => [File.read("../assets/emoji/#{thumbnail}")],
   :embeds      => [{:title       => post.title,
                     :author      => {:name => "ruby-lang.org | posted by #{post.author}",
                                      :url  => 'https://www.ruby-lang.org/en/news/'},
                     :color       => 0xCC342D,
                     :url         => "https://www.ruby-lang.org#{post.link}",
                     :thumbnail   => {:url => "attachment://#{thumbnail}"},
                     :description => post.content}]}
end

# Send our requests to Discord
requests.each do
  webhook.post it
end

# The following effort isn't really worth it, but we'd like to keep everything
# contained to a single file -- this file).
File
  .read(__FILE__)
  .split(/^__END__$/)
  .then do |script|
    File.open(__FILE__, 'w') do |f|
      f.puts(script.first)
      f.puts('__END__')
      f.puts(posts.last.title)
    end
  end

__END__
Ruby 3.3.4 Released
