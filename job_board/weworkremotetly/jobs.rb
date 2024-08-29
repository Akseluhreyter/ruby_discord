require 'open-uri'
require 'nokogiri'
require 'discord_webhook'
require 'yaml'

Post    = Struct.new(:title, :company, :region, :salary, :link, :image)
webhook = DiscordWebhook.new ENV['RUBY_DISCORD_HIRING']
stale   = YAML.load(DATA.read)&.map { Post.new(**it) } || []

html = Nokogiri::HTML(URI.open 'https://weworkremotely.com/remote-ruby-on-rails-jobs')

html
  .xpath('//li[@class="feature" or @class=""]')
  .map do |post|
    Post.new(
        title: post.at_xpath("a/span[@class='title']").text,
      company: post.at_xpath("a/span[@class='company']").text,
       region: post.at_xpath("a/span[@class='region company']")&.text,
        image: post.at_xpath("div/a/div[@class='flag-logo']")&.[]('style')&.[](/(?<=\().*(?=\?)/)&.concat('?auto=compress'),
         link: post.at_xpath("a")['href'],
    )
  end => posts

# We want to share only the recently added posts
recent = posts - stale

# Exit if nothing new. Don't update stale posts in __END__
exit if recent.empty?

# Share the posts with the most recent posted last to discord.
# We slice in groups of 10 because only 10 embeds per message.
requests = recent.reverse.map do |post|
  {:attachments => [{:id => 0, :filename => 'weworkremote.png'}],
   :files       => [File.read('../../assets/job_boards/weworkremote.png')],
   :embeds      => [{:title       => post.title,
                     :author      => {:name     => 'We Work Remotely',
                                      :url      => 'https://weworkremotely.com/remote-ruby-on-rails-jobs',
                                      :icon_url => 'attachment://weworkremote.png'},
                     :color       => 0xf03e3e,
                     :url         => "https://jobs.gorails.com#{post.link}",
                     :thumbnail   => {:url => post.image},
                     :description => 'Click the link to apply!',
                     :fields      => [{:name   => ':globe_with_meridians: Region',
                                       :inline => true,
                                       :value  => post.region  || 'Worldwide'},
                                      {:name   => ':office: Company',
                                       :inline => true,
                                       :value  => post.company},
                                      {:name   => ':moneybag: Salary',
                                       :inline => true,
                                       :value  => post.salary  || ''}],
                     :footer      => {:text => 'Automated Message: Do Not Respond On Discord.'}}]}
end

# Send them to discord!
requests.each do
  webhook.post it
end

# Write the posts we collected to be the new stale posts for next time
File
  .read(__FILE__)
  .split(/^__END__$/)
  .then do |script|
    File.open(__FILE__, 'w') do |f|
      f.puts(script.first)
      f.puts('__END__')
      f.puts(posts.map(&:to_h).to_yaml)
    end
  end

__END__
--- []
