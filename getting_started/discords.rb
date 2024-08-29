require 'json'
require 'open-uri'

require_relative '../../webhook/webhook'
using Webhook::DSL

INVITE_BASE = 'https://discord.com/api/v10/invites/%{invite}?with_counts=true'
ICON_BASE = 'https://cdn.discordapp.com/icons/%{id}/%{icon}.webp?size=80'

webhook = Webhook.new ENV['RUBY_DISCORD_LIBRARY'] # (thread: 1104650713864347678)

discords = {
  'Ruby Learning Center'  => ['Qtuk2u8dyG',      1104650718478094377, 'A welcoming community dedicated to learning and education.'],
  'Ruby AI Builders'      => ['MGDkCfyxXm',      1104650735557287977, 'A community of rubyists focused on building with AI.'],
  'DragonRuby'            => ['dragonruby-game-toolkit-608064116111966245',
                                                 1104650752460328960, 'Built for indie-game devs, '                           \
                                                                      '[DragonRuby](https://dragonruby.org/) is a powerful, ' \
                                                                      'professional grade 2D game engine and Ruby runtime. '  \
                                                                      'They have an active and kind discord community worth ' \
                                                                      'checking out if you like building games.'],
  'GoRails'               => ['gorails',         1104650769346592808, 'The companion discord to [GoRails](https://gorails.com). '   \
                                                                      'GoRails offers lessons and guides to help with every '       \
                                                                      'aspect of learning Ruby on Rails!'],
  'Gosu'                  => ['s5JFAT5VJK',      1104650786178342922, '[Gosu](https://www.libgosu.org/) is 2D game engine written ' \
                                                                      "in Ruby and C++. It's a great tool to learn or teach game "  \
                                                                      'development with Ruby.'],
  'Natalie'               => ['63YVSzygUj',      1104650803064602656, 'Discord community for the [Natalie](https://natalie-lang.org/) Ruby runtime.'],
  'Artichoke'             => ['QCe2tp2',         1104650820580028486, '[Artichoke Ruby Project](https://www.artichokeruby.org/), '  \
                                                                      'project news, tweets, PRs, and getting new contributors '    \
                                                                      'started.'],
  'StimulusReflex'        => ['stimulus-reflex', 1104650837474676778, 'A collaborative and engaging environment for developers who are interested in building with StimulusReflex.'],
  'Hotwired'              => ['PuSYcxHZWU',      1104650854943965215, 'Discord community for [Hotwire](https://hotwired.dev/).'],
  'Ruby on Rails'         => ['W2fXMyNWHA',      1104650871863783485, 'This is the server for contributing to the Ruby on Rails framework.'],
  'Discorb'               => ['DZwyMNQwpE',      1104650888863289394, '[Discorb](https://github.com/discorb-lib/discorb) is a Discord API wrapper using [Socketry/Async](https://github.com/socketry/async).'],
  'Ronin'                 => ['Yr6UWGSDzb',      1104912711114031164, 'Community for the Ronin security framework'],
  'Les Laboratoires Ruby' => ['8nqqNsa8Ee',      1105605942566998116, 'French speaking Ruby community \:)'],
  'Scarpe-diem'           => ['NEQxB2R6k8',      1105659537173790720, '"Scarpe" means shoes in Italian. "Scarpe" also means [Shoes](https://github.com/shoes/shoes-deprecated) in modern Ruby and webview!'],
  'Bridgetown'            => ['Rt7JCKavmE',      1106472516953837588, 'Bridgetown is a next-generation, progressive site generator & fullstack framework, powered by Ruby.'],
  'Langchain.rb'          => ['DkrNTyrQYM',      1120268265155985438, "Langchain.rb is a library that's an abstraction layer on top many emergent AI, ML and other DS tools."],
}

post = false

if post
	server = 'Langchain.rb'

	webhook.post(thread: 1104650713864347678) do
		data =
    	URI(INVITE_BASE % {invite: discords[server][0] })
      	.then { Net::HTTP.get _1 }
      	.then { JSON.parse    _1 }

		embed server do
  		url "https://discord.gg/#{discords[server][0]}"

    	thumbnail url: ICON_BASE % {id: data['guild']['id'], icon: data['guild']['icon']}
			description discords[server][2]

      footer text: "#{data['approximate_member_count']} members as of #{Time.now.strftime("%F")}."
   	end
	end
else
	webhook.patch(1104650713864347678, thread: 1104650713864347678) do
		thread_name 'Ruby Communities on Discord'
		content 'Below is a collection of other Ruby Discord communities.'

		embed "Index" do
			description discords.sort_by(&:first).map { |name, (invite, message, default)|
				"[#{name}](https://discord.com/channels/518658712081268738/1104650713864347678/#{message})"
			}.join("\n")
		end
	end => initial

	discords.each do |name, (invite, message, default)|
  	data =
    	URI(INVITE_BASE % {invite: })
      	.then { Net::HTTP.get _1 }
      	.then { JSON.parse    _1 }

  	webhook.patch(message, thread: 1104650713864347678) do
  	#webhook.post(thread: initial.channel_id) do
    	embed name do
      	url "https://discord.gg/#{invite}"

      	thumbnail url: ICON_BASE % {id: data['guild']['id'], icon: data['guild']['icon']}

      	case
      	when data.dig('guild', 'description')
        	description data['guild']['description']
      	when data.dig('guild', 'welcome_screen', 'description')
        	description data['guild']['welcome_screen']['description']
      	else
        	description default
      	end

      	footer text: "#{data['approximate_member_count']} members as of #{Time.now.strftime("%F")}."
    	end
  	end # webhook.patch

  	sleep 2
	end
end
