require 'open-uri'
require 'nokogiri'
require 'discord_webhook'
require 'yaml'

Post    = Struct.new(:title, :company, :region, :salary, :link, :image)
webhook = DiscordWebhook.new ENV['RUBY_DISCORD_HIRING']
stale   = YAML.load(DATA.read)&.map { Post.new(**it) } || []

#https://stackoverflow.com/questions/2572396/nokogiri-open-uri-and-unicode-characters
html = Nokogiri::HTML(URI.open("https://jobs.rubyonrails.org/").read)

html
  .xpath('//a[contains(@id, "job_")]')
  .map do |post|
    Post.new(                
      title:   post.at_xpath('*//h2/span[1]').text,
      company: post.at_xpath('*//h2/span[2]').text.delete_prefix('at '),
      region:  post.at_xpath('*//div/ul/li[2]').text.strip,
      salary:  post.at_xpath('*//div/ul/li[3]')&.text&.strip,
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
  {:attachments => [{:id => 0, :filename => 'rubyonrails.png'}],
   :files       => [File.read('../../assets/job_boards/rubyonrails.png')],
   :embeds      => [{:title       => post.title,
                     :author      => {:name     => 'Ruby on Rails',
                                      :url      => 'https://jobs.rubyonrails.org/',
                                      :icon_url => 'attachment://rubyonrails.png'},
                     :color       => 0xD30001,
                     :url         => "https://jobs.rubyonrails.org#{post.link}",
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
