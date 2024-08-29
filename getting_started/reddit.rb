require_relative '../../webhook/webhook'
using Webhook::DSL

webhook = Webhook.new ENV['RUBY_DISCORD_LIBRARY'] # (thread: 1104687918288748595)

webhook.patch(1104687918288748595, thread: 1104687918288748595) do
	thread_name 'Ruby Communities on Reddit'

	content 'The following is a collection of Ruby communities that have '      \
	        'formed on Reddit.'

	embed 'Reddit' do
		url 'https://www.reddit.com/'

		thumbnail url: ''

		description <<~REDDIT
			• [r/ruby](https://www.reddit.com/r/ruby)
      • [r/rubyonrails](https://www.reddit.com/r/rubyonrails)
      • [r/rubyonremote](https://www.reddit.com/r/rubyonremote/)
		REDDIT
	end
end
