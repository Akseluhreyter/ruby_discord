require_relative '../../webhook/webhook'
using Webhook::DSL

module Rank
  S = ''
  A = ''
  B = ''
  C = ''
  D = ''
  F = ''
end

webhook = Webhook.new ENV['RUBY_DISCORD_LIBRARY'] # (thread: 1106208124546850917)

if patch = true
  webhook.patch(1106208124546850917, thread: 1106208124546850917) do
    thread_name 'Good First Issues'

    content 'Below is a list of project with good first issues for ' \
            "beginners. They're rated based on availablity of opportunities, "\
            "knowledge needed, and the difficulty to implement a solution."
  end

  webhook.patch(1106208126975352842, thread: 1106208124546850917) do
    embed 'Scarpe' do
      url 'https://github.com/scarpe-team/scarpe/issues?q=is%3Aopen+label%3A%22good+first+issue%22%2C%22help+wanted%22'

      color 0xED4245

      thumbnail url: Rank::S

      description 'Scarpe is a relatively new project attempting to revive '  \
                  '[Shoes](http://shoesrb.com/).'

      field name: 'Needs', value: <<~NEEDS
        - [Examples](https://github.com/scarpe-team/scarpe/issues/173)
        - [Examples From Nobody Knows Shoes](https://github.com/scarpe-team/scarpe/issues/139)
        - [Correct Style Inconsistencies](https://github.com/scarpe-team/scarpe/issues/127)
      NEEDS

      field name: 'Discord', value: '[Invite](https://discord.gg/NEQxB2R6k8)'
    end
  end

  webhook.patch(1106208129491931238, thread: 1106208124546850917) do
    embed 'Ronin' do
      url 'https://github.com/issues?q=is%3Aopen+is%3Aissue+archived%3Afalse+user%3Aronin-rb+label%3Ahelp-wanted'

      color 0xE67E22

      thumbnail url: Rank::A

      description 'Ronin is an open-source tookit for security research and development.'

      field name: 'Needs', value: <<~NEEDS
        - [Add Missing Descriptions](https://github.com/ronin-rb/ronin-payloads/issues/81)
        - [Add RuboCop Support](https://github.com/ronin-rb/ronin-web-browser/issues/2)
        - [Add Test Coverage](https://github.com/ronin-rb/ronin-patch_ex/issues/22)
        - etc
      NEEDS

      field name: 'Discord', value: '[Invite](https://discord.gg/Yr6UWGSDzb)'
    end
  end

  webhook.patch(1106208134797729922, thread: 1106208124546850917) do
    embed 'Sorbet' do
      url 'https://github.com/sorbet/sorbet/labels/good%20first%20issue'

      color 0xFEE75C

      thumbnail url: Rank::B

      description '[Sorbet](https://sorbet.org/) is a powerful gradual type checker for Ruby.'
    end
  end

  webhook.patch(1106208137360453733, thread: 1106208124546850917) do
    embed 'Discorb' do
      url 'https://github.com/discorb-lib/discorb/issues'

      color 0xE67E22

      thumbnail url: Rank::A

      description 'A Discord API wrapper using [Socketry/Async](https://github.com/socketry/async).'

      field name: 'Needs', value: <<~NEEDS
        - Documentation
        - Examples
        - Hunt Bugs
      NEEDS

      field name: 'Discord', value: '[Invite](https://discord.gg/Yr6UWGSDzb)'
    end
  end

  webhook.patch(1106208139923177636, thread: 1106208124546850917) do
    embed 'ruby-lang.org' do
    	title 'www.ruby-lang.org'

      url 'http://www.ruby-lang.org/'

      color 0x57F287

      thumbnail url: Rank::C

      description 'The [ruby-lang.org](https://www.ruby-lang.org) website '   \
      						'has many opportunities if one is willing to look. '        \
      						"\n"                                                        \
      						"\n"                                                        \
      						"We need translations of our Discord invite section for "   \
      						"various languages. Please use this "                       \
      						"[invite link](https://discord.gg/ad2acQFtkh) and "         \
      						"**__do not use translation software__**."

      field name: 'Needs', value: <<~NEEDS
        - Translations (read above)
      NEEDS
    end
  end

  webhook.patch(1106208143127617576, thread: 1106208124546850917) do
    embed 'Natalie' do
      url 'https://github.com/natalie-lang/natalie/issues'

      color 0x57F287

      thumbnail url: Rank::C

      description 'Natalie is an early stage work-in-progress Ruby ' \
                  'implementation that compiles to C++.'

      field name: 'Needs', value: <<~NEEDS
        - [Implement Methods of Various Data Structures](https://github.com/natalie-lang/natalie/issues)
      NEEDS

      field name: 'Discord', value: '[Invite](https://discord.gg/63YVSzygUj)'
    end
  end

  webhook.patch(1106354797264785428, thread: 1106208124546850917) do
    embed 'rubygems.org' do
      url 'https://github.com/rubygems/rubygems.org/issues'

      color 0x57F287

      thumbnail url: Rank::C

      description "The Ruby community's #1 source for gems."

      field name: 'Needs', value: <<~NEEDS
        - Improve Styling and Simple Features
      NEEDS
    end
  end

  webhook.patch(1106391362103951370, thread: 1106208124546850917) do
    embed 'Improve RBS / Write RBS for gems' do
      url 'https://github.com/ruby/rbs'

      color 0xFEE75C

      thumbnail url: Rank::B

      description "RBS is a language used to describe the structure of Ruby " \
                  "programs and it's relatively new to the Ruby ecosystem."   \
                  "\n"                                                        \
                  "\n"                                                        \
                  "Many classes in the standard lib and third-party gems "    \
                  "don't ship with RBS yet. Please help improve situation "   \
                  "by writing RBS."                                           \
                  "\n"                                                        \
                  "\n"                                                        \
                  "Please check out <#1143338778384146574> if you have "      \
                  "questions about getting started."

      field name: 'Needs', value: <<~NEEDS
      	- Add RBS for [standard lib classes](https://github.com/ruby/rbs/labels/good%20first%20issue)
        - Add RBS for [socketry/async](https://github.com/socketry/async/issues/64)
        - etc
      NEEDS
    end
  end

  webhook.patch(1106410357016252426, thread: 1106208124546850917) do
    embed 'TruffleRuby' do
      url 'https://github.com/oracle/truffleruby/issues'

      color 0xFEE75C

      thumbnail url: Rank::B

      description 'The high-performance Ruby implementation for GraalVM ' \
                  'needs help with changes involving the lastest Ruby.'

      field name: 'Needs', value: <<~NEEDS
        - [Add Ruby 3.2 Support](https://github.com/oracle/truffleruby/issues/3039)
      NEEDS
    end
  end

  webhook.patch(1106430170681835581, thread: 1106208124546850917) do
    embed 'GraphQLDocs' do
      url 'https://github.com/brettchalupa/graphql-docs/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22'

      thumbnail url: Rank::C

      color 0x57F287

      description 'A Ruby CLI for generating documentation from GraphQL schema.'

      field name: 'Needs', value: <<~NEEDS
        - [Document Public Classes and Methods](https://github.com/brettchalupa/graphql-docs/issues/110)
      NEEDS
    end
  end

  webhook.patch(1106480030973964328, thread: 1106208124546850917) do
    embed 'Bridgetown' do
      url 'https://github.com/bridgetownrb/bridgetown/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22'

      thumbnail url: Rank::A

      color 0xE67E22

      description 'Bridgetown, the site generator and fullstack framework, '  \
                  'needs help implementing plugins and default configurations.'

      field name: 'Needs', value: <<~NEEDS
        - Implement Simple Plugins
      NEEDS

      field name: 'Discord', value: '[Invite](https://discord.gg/Rt7JCKavmE)'
    end
  end
end
