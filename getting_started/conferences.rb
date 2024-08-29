require 'nokogiri'
require 'open-uri'

# I don't think we can use strftime to make pretty dates since most are ranges.
# So the following abbreviations are the middle ground for now.
ABBR = { 'January'   => 'Jan',
         'February'  => 'Feb',
         'March'     => 'Mar',
         'April'     => 'Apr',
         'May'       => 'May',
         'June'      => 'Jun',
         'July'      => 'Jul',
         'August'    => 'Aug',
         'September' => 'Sep',
         'October'   => 'Oct',
         'November'  => 'Nov',
         'December'  => 'Dec',
        }

ABBR.default_proc = ->(hash, key) { key }

Conference = Struct.new(:name, :link, :date, :location, :socials)

html = Nokogiri::HTML(URI.open 'https://rubyconferences.org/')

html
  .xpath('//dl')
  .children
  .reject { |node| node.name == 'text' }
  .each_slice(2)
  .map do |dt, dd|
    name = dt.text[/(?<=\n  ).+(?=\n)/]
    link = dt.at_xpath('a')['href']
    date, location, *socials = dd.text.scan(/(?=[^\n ]).+(?<=[^\n ])/)

    Conference.new(name:, link:, date:, location:, socials:)
  end => conferences

  conferences[...5].each do |conf|
    puts "* ``#{conf.date.sub(/\w+/) { ABBR[_1]}}`` **|** [#{conf.name}](#{conf.link}) **|** #{conf.location}"
  end

  # rubyconferences.org doesn't stay as up to date as we'd like.
  #conferences[1..4].each do |conf|
  #  puts "* [#{conf.name}](#{conf.link})\n" \
  #       " * Where: #{conf.location}\n"     \
  #       " * Date: #{conf.date}"
  #end
