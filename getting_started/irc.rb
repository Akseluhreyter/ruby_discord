require_relative '../../webhook/webhook'
using Webhook::DSL

webhook = Webhook.new ENV['RUBY_DISCORD_LIBRARY'] # (thread: 1104678939080790017)

webhook.patch(1104678939080790017, thread: 1104678939080790017) do
	thread_name "Ruby Communities on IRC"
	content 'Below is a collection of Ruby communities that have '              \
	        'formed over internet relay chat (IRC)'
end => initial

webhook.patch(1104678941790306495, thread: 1104678939080790017) do
	embed 'Libera' do
		url 'https://web.libera.chat'

		thumbnail url: ''

		description "Providing a community platform for free and open-source software and peer directed projects. " \
								"\n"                                                          \
								"\n"                                                          \
								"Connect by pointing your IRC client to __irc.libera.chat:6697 (TLS)__"

		field name: 'Channels',
				 value: "• [#ruby](https://web.libera.chat/#ruby)\n"                  \
								"• [#jruby](https://web.libera.chat/#jruby)"

		footer text: 'Source: libera.chat'
	end
end
