require_relative '../../webhook/webhook'
using Webhook::DSL

webhook = Webhook.new ENV['RUBY_DISCORD_LIBRARY'] # (thread: 1104733321801498635)

webhook.post(thread: 1104733321801498635) do
	embed 'Code and the Coding Coders who Code it' do
		url 'https://podcast.drbragg.dev/'

		thumbnail url: ''

		description 'We talk about Ruby, Rails, JavaScript, and everything in '   \
								'between. From tiny tips to bigger challenges we take on 3 '  \
								"questions a show; What are you working on? What's blocking " \
								"you? What's something cool you want to share?"

		footer text: 'Source: podcast.drbragg.dev'
	end
end

__END__
webhook.post(thread: 1104733321801498635) do
	embed 'Rubber Duck Dev Show' do
		url 'https://www.rubberduckdevshow.com/'

		thumbnail url: ''

		description "A free weekly show on software development. "                \
								"Keep current on the latest trends in the "                   \
								"industry with the Rubber Duck Devs!"

	  footer text: 'Source: rubberduckdevshow.com'
	end
end


webhook.patch(1104733321801498635, thread: 1104733321801498635) do
  thread_name 'Ruby Podcasts'
  content "Below is a collection of podcasts that follow the Ruby community."
end => initial

webhook.post(thread: 1104733324448116806) do
  embed 'Rooftop Ruby' do
    url ''

    thumbnail url: ''

    description 'Two Ruby programmers (Collin Donnell and Joel Drapper) '     \
                'discuss Ruby, web and native software development, '         \
                'technology, and more.'

    footer text: 'Source: rooftopruby.com'
  end
end

webhook.post(thread: 1104733327044395100) do
  embed 'Remote Ruby' do
    url 'https://remoteruby.com/'

    thumbnail url: ''

    description 'Sit in on a conversation with three Ruby developers. '       \
                'On Remote Ruby we interview web developers, share thoughts ' \
                'about web development, and give you an inside look at our '  \
                'lives as Ruby developers.'

    footer text: 'Source: remoteruby.com'
  end
end

webhook.post(thread: 1104733329238016070) do
  embed 'Ruby Rogues' do
    url 'https://rubyrogues.com/'

    thumbnail url: ''

    description 'A weekly discussion around Ruby, Rails, software development, and the community around Ruby'

    footer text: 'Source: rubyrogues.com'
  end
end

webhook.post(thread: 1104733331431628900) do
  embed 'The Ruby on Rails Podcast' do
    url 'https://www.therubyonrailspodcast.com/'

    thumbnail url: ''

    description 'The Ruby on Rails Podcast, a weekly conversation about '     \
                'Ruby on Rails, open source software, and the programming '   \
                'profession. Co-hosted by Brittany Martin, Brian Mariani, '   \
                'Jemma Issroff and Nick Schwaderer. Produced by Mirror '      \
                'Placement. Edited by Peachtree Sound.'

    footer text: 'Source: therubyonrailspodcast.com'
  end
end
