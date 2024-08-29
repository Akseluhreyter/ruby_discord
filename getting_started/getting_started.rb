require 'discord_webhook/dsl'

webhook = DiscordWebhook.new ENV['RUBY_DISCORD_GETTING_STARTED']

webhook.post do
#webhook.patch(1128170192476844032) do
  embed title: "What is Ruby?" do
    url is: 'https://www.ruby-lang.org/' and color is: :ruby #0xCC342D

    thumbnail url: 'attachment://ruby.png'

    description is: 'Ruby is a dynamic, object-oriented programming language '  \
                    'that strikes a beautiful balance between power and '       \
                    'simplicity.'                                               \
                    "\n"                                                        \
                    "\n"                                                        \
                    "You can [try Ruby](https://try.ruby-lang.org/) right now " \
                    "in your browser!"
  end
#end

#webhook.post do
  embed title: 'How to Install Ruby?' do
    color is: :ruby and url is: 'https://www.ruby-lang.org/en/documentation/installation/'

    thumbnail url: 'attachment://1f5a5.png'

    description is: 'We recommend using one of the version managers or '          \
                    'installers listed below to install Ruby:¹'

    field name: 'Ruby Version Managers', inline: true, value: <<~MANAGER
      - [asdf](https://asdf-vm.com/)
      - [Chruby](https://github.com/postmodern/chruby)
      - [mise-en-place](https://mise.jdx.dev/)
      - [rbenv](https://github.com/rbenv/rbenv)²
      - [RVM](https://rvm.io/)
    MANAGER

    field name: 'Ruby Installers', inline: true, value: <<~INSTALLER
      - [ruby-install](https://github.com/postmodern/ruby-install)
      - [RubyInstaller for Windows](https://rubyinstaller.org/)¹
    INSTALLER

    field name: 'Notes', value: <<~NOTES
      1. Windows users are recommended to use to [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).
      2. Use this [installer script](https://github.com/rbenv/rbenv-installer) for rbenv.
    NOTES
  end
#end
    #field name: 'Community', value: <<~COMMUNITY
    #  - [Ruby Communities on Discord](https://discord.com/channels/518658712081268738/1104650713864347678)
    #  - [Ruby Communities on IRC](https://discord.com/channels/518658712081268738/1104678939080790017)
    #  - [Ruby Communities on Reddit](https://discord.com/channels/518658712081268738/1104687918288748595)
    #  - [Ruby Newsletters](https://discord.com/channels/518658712081268738/1104697589934338050)
    #  - [Ruby Podcasts](https://discord.com/channels/518658712081268738/1104733321801498635)
    #  - [Ruby Runtime Alternatives](https://discord.com/channels/518658712081268738/1104740691113943070)
    #COMMUNITY
#  end

  embed title: "What Can You Do With Ruby?" do
    color is: :ruby and thumbnail url: 'attachment://1f9f0.png'

    description is: "If you're curious about the kind of things you can do with " \
                    "Ruby, check out the below tools and share your projects in <#519951147931271169>!"

    field name: 'AI/ML', inline: true, value: <<~MACHINE
      - [OpenAI](https://github.com/alexrudall/ruby-openai)
      - [Langchain.rb](https://github.com/andreibondarev/langchainrb)
      - [Rumale](https://github.com/yoshoku/rumale)
    MACHINE

    field name: 'CLI', inline: true, value: <<~CLI
      - [curses](https://github.com/ruby/curses)
      - [colorize](https://github.com/fazibear/colorize)
      - [ProgressBar](https://github.com/paul/progress_bar)
      - [TTY](https://github.com/piotrmurach/tty)
      - [Terminal Table](https://github.com/tj/terminal-table)
      - [Thor](https://github.com/rails/thor)
      - [OptionParser](https://docs.ruby-lang.org/en/master/OptionParser.html)
    CLI

    field name: 'Data Analysis', inline: true, value: <<~DATA
      - [SciRuby](https://github.com/SciRuby)
      - [Numo](https://github.com/ruby-numo)
      - [Rover](https://github.com/ankane/rover)
    DATA

    field name: 'Discord', inline: true, value: <<~DISCORD
      - [discorb](https://github.com/discorb-lib/discorb)
      - [discordrb](https://github.com/shardlab/discordrb)
    DISCORD

    field name: 'Gaming and Graphics', inline: true, value: <<~GAMES
      - [Ruby 2D](https://www.ruby2d.com/)
      - [Graphics](https://github.com/zenspider/graphics)
      - [Gosu](https://www.libgosu.org/)
      - [DragonRuby](https://dragonruby.org/)
    GAMES

    field name: 'GUI', inline: true, value: <<~GUI
      - [Scarpe](https://github.com/scarpe-team/scarpe)
      - [Glimmer](https://github.com/AndyObtiva/glimmer)
      - [LibUI](https://github.com/kojix2/LibUI)
      - [Tk](https://github.com/ruby/tk)
      - [FXRuby](https://github.com/larskanis/fxruby)
      - [wxRuby3](https://github.com/mcorino/wxRuby3)
    GUI

    field name: 'Music', inline: true, value: <<~MUSIC
      - [Sonic Pi](https://sonic-pi.net)
      - [Coltrane](https://github.com/pedrozath/coltrane)
      - [Black Candy](https://github.com/blackcandy-org/black_candy)
      - [WahWah](https://github.com/aidewoode/wahwah)
    MUSIC

    field name: 'Security', inline: true, value: <<~SECURITY
      - [Ronin](https://github.com/ronin-rb)
      - [Metasploit Framework](http://www.metasploit.com/)
      - [SCNR](https://ecsypno.com/)
      - [PWN](https://github.com/0dayinc/pwn)
    SECURITY

    field name: 'Web Framework', inline: true, value: <<~FRAMEWORKS
      - [Ruby on Rails](https://rubyonrails.org/)
      - [Hanami](https://hanamirb.org/)
      - [Roda](https://roda.jeremyevans.net/)
      - [Sinatra](https://sinatrarb.com/)
      - [Camping](https://github.com/camping/camping)
      - [Bridgetown](https://github.com/bridgetownrb)
      - [Nanoc](https://nanoc.app/)
    FRAMEWORKS

    field name: 'Web Automation', inline: true, value: <<~AUTOMATION
      - [Ferrum](https://ferrum.rubycdp.com/)
      - [Capybara](https://github.com/teamcapybara/capybara)
      - [Watir](https://github.com/watir/watir)
      - [Mechanize](https://github.com/sparklemotion/mechanize)
      - [Spidr](https://github.com/postmodern/spidr)
      - [Cuprite](https://github.com/rubycdp/cuprite)
      - [Tanakai](https://github.com/glaucocustodio/tanakai)
      - [Nokogiri](https://nokogiri.org/)
    AUTOMATION
  end

  #embed title: 'Looking to contribute?' do
  #  color is: :ruby and thumbnail url: ''
  #
  #  description is: 'Think you have a decent grasp of Ruby and are looking to '   \
  #                  'contribute? Check out our list of [Good First Issues](https://discord.com/channels/518658712081268738/1106208124546850917). '  \
  #                  "These projects are great for beginners looking to make "     \
  #                  'their first contribution to open source.'
  #end

  attach file: "../assets/ruby.png"
  attach file: "../assets/emoji/1f5a5.png"
  attach file: "../assets/emoji/1f9f0.png"
end
