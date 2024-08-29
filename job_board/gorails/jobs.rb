require 'open-uri'
require 'nokogiri'
require 'discord_webhook'
require 'yaml'

Post    = Struct.new(:title, :company, :region, :salary, :link, :image)
webhook = DiscordWebhook.new ENV['RUBY_DISCORD_HIRING']
stale   = YAML.load(DATA.read)&.map { Post.new(**it) } || []

html = Nokogiri::HTML(URI.open "https://jobs.gorails.com/")

html
  .at_xpath('//ul[@role="list"]')
  .xpath('./li/a')
  .map do |post|
    Post.new(
      title:   post.at_xpath('*//div[1]/div[1]/h3').text,
      company: post.at_xpath('*//div[1]/div[1]/p').text,
      region:  post.at_xpath('*//div[2]/div[1]/div/p').text,
      salary:  post.at_xpath('*//div[2]/div[1]/p[3]/span')&.text,
      link:    post['href'],
      image:   post.at_xpath('*//img')&.[]('src'),
    )
  end => posts

# We want to share only the recently added posts
recent = posts - stale

# Exit if nothing new. Don't update stale posts in __END__
exit if recent.empty?

puts recent.collect(&:title)

# Share the posts with the most recent posted last to discord.
# We slice in groups of 10 because only 10 embeds per message.
requests = recent.reverse.map do |post|
  {:attachments => [{:id => 0, :filename => 'go_rails.png'}],
   :files       => [File.read('../../assets/job_boards/go_rails.png')],
   :embeds      => [{:title       => post.title,
                     :author      => {:name     => 'Go Rails',
                                      :url      => 'https://jobs.gorails.com/',
                                      :icon_url => 'attachment://go_rails.png'},
                     :color       => 0xdc2626,
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

requests.each { webhook.post it } 

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
