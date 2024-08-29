require 'nokogiri'
require 'open-uri'
require 'discord_webhook'

require_relative '../utilities/markdown'

SITE    = 'https://blog.rubygems.org'
LIMIT   = 1000 # the number of chars to limit content

Post    = Struct.new(:title, :author, :content, :link)

webhook = DiscordWebhook.new ENV['RUBY_DISCORD_RUBY_GEMS']
last    = DATA.read.chomp
html    = Nokogiri::HTML(URI.open SITE)

posts = 
  html
    .xpath('//a[@class="blog__post"]')
    .take_while { it.at_xpath('./b').text != last }
    .reverse # so most recent is last
    .map do |node|
      title = node.at_xpath('./b').text
      link  = SITE + node['href']

      blog_post = Nokogiri::HTML(URI.open link)

      author =
        blog_post
          .at_xpath('//p[@class="post__author--s"]')
          .text
          .delete_prefix('by ')

      content =
        blog_post
          .at_xpath('//div[@class="t-body"]')
          .children
          .reduce("") do |str, node|
            markdown = ReverseMarkdown.convert(node).chomp

            break str if str.length + markdown.length > LIMIT
            
            if markdown.match?(/\A-/)
              str << markdown.chomp
            elsif !markdown.empty? && markdown != "\n"
              str << "\n" << markdown
            end

            str
          end

      Post.new(title:, author:, content:, link:)
    end

# Create requests for each new post
requests = posts.map do |post|
  {:embeds => [{:title       => post.title,
                :author      => {:name => "blog.rubygems.org | post by #{post.author}",
                                 :url  => 'https://blog.rubygems.org/'},
                :color       => 0xe9573f,
                :url         => post.link,
               #:thumbnail   => {:url => "attachment://"},
                :description => post.content}]}
end

puts posts.collect(&:title)

requests.each { webhook.post it }
__END__
3.5.15 Released
