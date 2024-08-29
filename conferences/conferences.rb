require 'nokogiri'
require 'open-uri'
require 'time'
require 'discord_webhook'

def save(data)
  File.read(__FILE__)[/.*(?=__END__\n)/m].then do |script|
    File.open(__FILE__, 'w') do |file|
      file.puts(script)
      file.puts('__END__')
      file.puts(data)
    end
  end
end

# Some time constants we can use when creating an interval to search
SECOND =  1
MINUTE = 60 * SECOND
HOUR   = 60 * MINUTE
DAY    = 24 * HOUR
WEEK   =  7 * DAY
MONTH  =  4 * WEEK
YEAR   = 12 * MONTH

CURRENT   = Time.now
LOOKAHEAD = Time.now + 3 * MONTH

PREVIOUSLY_SEEN = DATA.readlines(chomp: true)

Conference = Struct.new(:name, :link, :date, :location, :socials)

webhook = Webhook.new ENV['RUBY_DISCORD_CONFERENCES']

html = Nokogiri::HTML(URI.open 'https://rubyconferences.org/')
#html = Nokogiri::HTML(File.read 'Ruby Conferences.html')

html
  .xpath('//dl')
  .children
  .reject { |node| node.name == 'text' }
  .each_slice(2)
  .map do |dt, dd|
    name = dt.text[/(?<=\n  ).+(?=\n)/]
    link = dt.at_xpath('a')['href']
    date, location, *social_names = dd.text.scan(/(?=[^\n ]).+(?<=[^\n ])/)
    social_links = dd.xpath('./ul/li/a').collect { |node| node['href'] }

    socials = social_names.zip(social_links)#.map do |site, link|
    #  "[#{site}](#{link})"
    #end

    Conference.new(name:, link:, date:, location:, socials:)
  end => conferences

  conferences.select! do |conf|
    date = conf.date.match(/\b(?<month>[A-Za-z]+)\s+(?<start_day>\d{1,2})(?:–(?<end_day>\d{1,2}))?,\s*(?<year>\d{4})\b/)

    month     = date['month']
    start_day = date['start_day']
    year      = date['year']
    time      = Time.parse("#{month} #{start_day}, #{year}")
    
    time > CURRENT && time < LOOKAHEAD
  end

  sharable =
    conferences.reject { |conf| PREVIOUSLY_SEEN.include? conf.name }

  exit if sharable.empty?

  sharable.map do |conf|
    date     = "#{ conf.date }"
    location = "#{ conf.location }"
    socials  = conf.socials.map do |site, link|
      "[#{site}](#{link})"
    end.join(" • ")
    
    <<~INFO
      # [#{conf.name}](#{conf.link})
      ### #{ date } • #{ location } • #{ socials }
    INFO
  end => posts

  posts.each { |post| webhook.post({content: post) }

  save(sharable.collect(&:name))
__END__
Ruby Warsaw Community Conference 2024
Ruby devroom at FOSDEM 2024
