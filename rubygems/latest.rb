require 'json'
require 'net/http'
require 'discord_webhook/dsl'

def save(data)
  File.read(__FILE__)[/.*(?=__END__\n)/m].then do |script|
    File.open(__FILE__, 'w') do |file|
      file.puts(script)
      file.puts('__END__')
      file.puts(data)
    end
  end
end

webhook  = DiscordWebhook.new(ENV['RUBY_DISCORD_RUBY_GEMS'])

latest = Net::HTTP.get_response(URI 'https://rubygems.org/api/v1/activity/just_updated.json')

if latest.is_a? Net::HTTPSuccess
  gems = JSON.parse(latest.body)

  last_seen = DATA.read.chomp

  recent = gems.take_while { _1['name'] != last_seen }.reverse

  recent.each_slice(10) do |gems|
    webhook.post do
      gems.each do |gem|
        embed title: gem['name'] do
          url    is: gem['project_uri']
          color  is: 0xe9573f

          author name: 'RubyGems.org',
                  url: 'https://rubygems.org/',
             icon_url: '../assets/ruby-gems.224x256.png'

          description is: gem['info']

          field name: 'authors',   value: gem['authors'  ]
          field name: 'version',   value: gem['version'  ]
          field name: 'licenses',  value: gem['licenses' ].join(',')
          field name: 'Downloads', value: gem['downloads']
        end # embed
      end # gems
    end # post
  end # each_slice

  save(recent.last['name']) unless recent.empty?
end
__END__
