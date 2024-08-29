require_relative '../../webhook/webhook'
using Webhook::DSL

webhook = Webhook.new ENV['RUBY_DISCORD_LIBRARY'] # (thread: 1103890263543398442)

#webhook.post(wait: true) do
webhook.patch(1104740691113943070, thread: 1104740691113943070) do
	thread_name 'Ruby Runtime Alternatives'
	content 'Listed below are various _active_, alternative Ruby implementations.'
end => initial

#webhook.post(thread: initial.channel_id) do
webhook.patch(1104740694603603978, thread: 1104740691113943070) do
  embed 'mruby' do
    url 'https://mruby.org/'

    thumbnail url: ''

    description 'An embeddable, lightweight Ruby implementation. It aims to ' \
                'be compliant with a subset of the ISO standard.'

    footer text: 'Latest release v3.2.0 on 24 Feb 2023'
  end
end

#webhook.post(thread: initial.channel_id) do
webhook.patch(1104740697048879104, thread: 1104740691113943070) do
  embed 'JRuby' do
    url 'https://www.jruby.org/'

    thumbnail url: ''

    description "Ruby for the JVM. It's 3.1 compatible and offers real "      \
                "threading and higher performance with the full power of "     \
                "the JVM."

    footer text: 'Latest release v9.4.2.0 on 8 Mar 2023'
  end
end

#webhook.post(thread: initial.channel_id) do
webhook.patch(1104740699217350696, thread: 1104740691113943070) do
  embed 'TruffleRuby' do
    url 'https://github.com/oracle/truffleruby'

    thumbnail url: ''

    description 'A high-performance Ruby implementation designed for the GraalVM.'

    footer text: 'Latest release v23.0.0-preview1 on 28 Apr 2023'
  end
end

#webhook.post(thread: initial.channel_id) do
webhook.patch(1104740701738123326, thread: 1104740691113943070) do
  embed 'Opal' do
    url 'https://opalrb.com/'

    thumbnail url: ''

    description 'Opal is a Ruby to JavaScript source-to-source compiler.'     \
                'It is both fast as a runtime and small in its footprint'

    footer text: 'Latest release v1.7.3 on 23 Mar 2023'
  end
end

#webhook.post(thread: initial.channel_id) do
webhook.patch(1104740703772356669, thread: 1104740691113943070) do
  embed 'Natalie' do
    url 'https://natalie-lang.org/'

    thumbnail url: ''

    description 'Natalie is a work-in-progress Ruby implementation that compiles to C++.'

    footer text: 'Natalie is an ongoing work-in-progress.'
  end
end

#webhook.post(thread: initial.channel_id) do
webhook.patch(1104740706377027604, thread: 1104740691113943070) do
  embed 'Artichoke' do
    url 'https://www.artichokeruby.org/'

    thumbnail url: ''

    description 'Artichoke is a Ruby made with Rust. Artichoke aims to be '   \
                'MRI compatible with recent Ruby 3.1.2.'

    footer text: 'Latest release v0.1.0-pre.0'
  end
end
