require 'open-uri'
require 'nokogiri'
require 'discord_webhook'
require 'yaml'

Post    = Struct.new(:title, :company, :region, :salary, :featured, :link, :image)
webhook = DiscordWebhook.new ENV['RUBY_DISCORD_HIRING']
stale   = YAML.load(DATA.read)&.map { Post.new(**it) } || []

html = Nokogiri::HTML(URI.open "https://rubyonremote.com/remote-jobs/")

html
  .xpath('//main//li')
  .xpath('//a[@class="flex w-full"]')
  .map do |post|
    Post.new(                 #'/html/body/section/section/main/section/div/ul/li[2]'
      title:    post.at_xpath('*//div[2]/div[1]/div[1]/h2').text.strip,
      company:  post.at_xpath('*//div[2]/div[1]/div[1]/p').text.strip,
      region:   post.at_xpath('*//div[2]/div[1]/div[2]/div/div[1]/span[2]')&.text,
      salary:   post.at_xpath('*//div[2]/div[1]/div[2]/div/div[2]/span[2]')&.text,
      link:     post['href'],
      image:    post.at_xpath('*//picture/img')&.[]('src'),
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
  {:attachments => [{:id => 0, :filename => 'rubyonremotelogo.png'}],
   :files       => [File.read('../../assets/job_boards/rubyonremotelogo.png')],
   :embeds      => [{:title       => post.title,
                     :author      => {:name     => 'Ruby On Remote',
                                      :url      => 'https://rubyonremote.com',
                                      :icon_url => 'attachment://rubyonremotelogo.png'},
                     :color       => 0xEF4255,
                     :url         => "https://rubyonremote.com#{post.link}",
                     :thumbnail   => {:url => post.image},
                     :description => 'Click the link to apply!',
                     :fields      => [{:name   => ':globe_with_meridians: Region',
                                       :inline => true,
                                       :value  => post.region  || 'Worldwide'},
                                      {:name   => ':office: Company',
                                       :inline => true,
                                       :value  => post.company || ''},
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
