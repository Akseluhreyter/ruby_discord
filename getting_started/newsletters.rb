require_relative '../../webhook/webhook'
using Webhook::DSL

webhook = Webhook.new ENV['RUBY_DISCORD_LIBRARY'] # (thread: 1104697589934338050)

#webhook.post(wait: true) do
# thread_name 'Ruby Newsletters'
# content 'The following is a collection of newsletters that follow the Ruby community.'
#end => initial

webhook.patch(1104697589934338050, thread: 1104697589934338050) do
  thread_name 'Ruby Newsletters'
  content 'Below is a collection of newsletters that follow the Ruby community.'
end

webhook.patch(1104697592589324378, thread: 1104697589934338050) do
  embed 'Short Ruby Newsletter' do
    url 'https://newsletter.shortruby.com/'

    thumbnail url: ''

    description "Weekly Newsletter with what's new in Ruby world"
	end

	embed do
    footer text: "Source: newsletter.shortruby.com"
  end
end

webhook.patch(1104697594833281104, thread: 1104697589934338050) do
  embed 'Ruby Radar' do
    url 'https://www.rubyradar.com/'

    thumbnail url: ''

    description "Stay up-to-date on the latest Ruby trends with Ruby Radar "  \
                "- your weekly dose of carefully curated Ruby-related "       \
                "content across different mediums and experience levels, "    \
                "delivered every Sunday morning in a fast and easy-to-read "  \
                "format!"
	end

	embed do
    footer text: 'Source: rubyradar.com'
  end
end

webhook.patch(1104697597291147275, thread: 1104697589934338050) do
  embed 'Ruby Weekly' do
    url 'https://rubyweekly.com/'

    thumbnail url: ''

    description 'A free, once–weekly e-mail round-up of Ruby news and articles.'
	end

	embed do
    footer text: "Source: rubyweekly.com"
  end
end

webhook.patch(1105354829112553492, thread: 1104697589934338050) do
  embed 'Once a Maintainer' do
    url 'https://onceamaintainer.substack.com/'

    thumbnail url: ''

    description "Each week we profile an OSS maintainer and ask them about "  \
                "themselves. Our goal is to celebrate the work that "         \
                "maintainers are doing and to grow the community around "     \
                "open source."
  end

  embed do
  	footer text: 'Source: onceamaintainer.substack.com/p/coming-soon'
  end
end
