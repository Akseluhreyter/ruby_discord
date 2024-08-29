require 'net/http'
require 'json'
require 'discord_webhook'
require 'time'

INVITE_BASE = 'https://discord.com/api/v10/invites/%{invite}?with_counts=true'
ICON_BASE   = 'https://cdn.discordapp.com/icons/%{id}/%{icon}.webp?size=80'
RECENT      = Time.now - 2 * 7 * 24 * 60 * 60 # 2 weeks ago
DISCORDS    = [
  ['Ruby Learning Center' , ' 1 January  1970', 'Qtuk2u8dyG', 'A welcoming community dedicated to learning and education.'],
  ['Ruby AI Builders'     , ' 1 January  1970', 'MGDkCfyxXm', 'A community of rubyists focused on building with AI.'],
  ['DragonRuby'           , ' 1 January  1970', 'dragonruby-game-toolkit-608064116111966245',
                              '[DragonRuby](https://dragonruby.org/) is a powerful, professional grade 2D game engine and Ruby runtime. '],
  ['GoRails'              , ' 1 January  1970', 'gorails-874684608686477352',
                              'The companion discord to [GoRails](https://gorails.com). GoRails offers lessons and guides to help with every aspect of learning Ruby on Rails!'],
  ['Gosu'                 , ' 1 January  1970', 's5JFAT5VJK', "[Gosu](https://www.libgosu.org/) is 2D game engine written in Ruby and C++. It's a great tool to learn or teach game development with Ruby."],
  ['Natalie'              , ' 1 January  1970', '63YVSzygUj', 'Community for the [Natalie](https://natalie-lang.org/) Ruby runtime.'],
  ['Artichoke'            , ' 1 January  1970', 'QCe2tp2',    '[Artichoke Ruby Project](https://www.artichokeruby.org/), project news, tweets, PRs, and getting new contributors started.'],
  ['StimulusReflex'       , ' 1 January  1970', 'stimulus-reflex',
                              'A collaborative and engaging environment for developers who are interested in building with StimulusReflex.'],
  ['Hotwired'             , ' 1 January  1970', 'PuSYcxHZWU', 'Discord community for [Hotwire](https://hotwired.dev/).'],
  ['Ruby on Rails'        , ' 1 January  1970', 'W2fXMyNWHA', 'This is the server for contributing to the Ruby on Rails framework.'],
  ['Ruby on Rails'        , ' 1 January  1970', 'QWQPnpJ79H', 'Dedicated to gathering Ruby on Rails lovers to communicate and study together.'],
  ['Discorb'              , ' 1 January  1970', 'DZwyMNQwpE', '[Discorb](https://github.com/discorb-lib/discorb) is a Discord API wrapper built on [Socketry/Async](https://github.com/socketry/async).'],
  ['Ronin'                , ' 1 January  1970', 'Yr6UWGSDzb', 'Community for the Ronin security framework.'],
  ['Les Laboratoires Ruby', ' 1 January  1970', '8nqqNsa8Ee', 'French speaking Ruby community \:)'],
  ['Scarpe-diem'          , ' 1 January  1970', 'NEQxB2R6k8', '"Scarpe" means shoes in Italian. "Scarpe" also means [Shoes](https://github.com/shoes/shoes-deprecated) in modern Ruby and webview!'],
  ['Bridgetown'           , ' 1 January  1970', 'Rt7JCKavmE', 'Bridgetown is a next-generation, progressive site generator & fullstack framework, powered by Ruby.'],
  ['Langchain.rb'         , ' 1 January  1970', 'DkrNTyrQYM', "Langchain.rb is a library that's an abstraction layer on top many emergent AI, ML and other DS tools."],
  ['RubySur'              , ' 1 January  1970', 'Vn6cSF8rCZ', 'South American Ruby Community \:)'],
  ['Sonic Pi Community'   , ' 1 January  1970', 'KUV798W7N8', 'Unofficial Sonic Pi Community.'],
  ['Shard Lab'            , ' 1 January  1970', 'DSynz9e5hN', 'Community for the [discordrb](https://github.com/shardlab/discordrb) project.'],
  ['SpinaCMS'             , ' 1 January  1970', 'cZ3nvxarxA', 'Community for [Spina CMS](https://github.com/SpinaCMS/Spina).'],
  ['Bit of Binary'        , ' 6 February 2024', 'GdJwdY3gzj', 'A community for those beginning their Ruby learning journey.'],
  ['EnRails'              , '12 February 2024', 'wbZBfRfY72', 'A spanish speaking Rails community.'],
  ['Deanio'               , '25 June     2024', 'yD4FQCgYbX', 'Community for the [Deanin](https://www.youtube.com/@Deanin) YouTube channel that covers Ruby on Rails and other software development content.'],
  ['Cozy Ruby'            , '28 June     2024', 'DSTJ95NE7p', 'Ruby discord for the Swedish (and friends!) community']
].sort

webhook = DiscordWebhook.new ENV['RUBY_DISCORD_OTHER_RUBY_DISCORDS']

# update our discord descriptions to use their description
DISCORDS.each do |name, date, invite, description|
  sleep 1

  print "Retrieving data for #{ name }... "
  
  data =
    URI(INVITE_BASE % {invite: })
      .then { Net::HTTP.get _1 }
      .then { JSON.parse    _1 }

  description.replace(data.dig('guild', 'description')                   ||
                      data.dig('guild', 'welcome_screen', 'description') ||
                      description)

  puts "Done."
end

DATA.readlines(chomp: true).each do |id|
  webhook.delete(id)
  sleep 1
rescue
  $stderr.puts "Unable to delete message with id: #{ id }"
end

list =
  DISCORDS.map do |name, date, invite, description|
    date = Time.parse(date)
  
    "- **__[#{ name }](https://discord.gg/#{ invite })__** #{ ':new:' if date > RECENT }\n" \
    " - #{ description }"
  end

# Create the index. The message ids will be written under __END__ later
index = 
  list.map do |content|
    sleep 1
    
    webhook.post({ content:, flags: 1 << 2 }, wait: true)
  end

File
  .read(__FILE__)
  .split(/^__END__$/)
  .then do |script|
    File.open(__FILE__, 'w') do |f|
      f.puts(script.first)
      f.puts('__END__')
      f.puts(index.collect { it[:id] })
    end
  end
    
__END__
1256293528817111191
1256293533900472344
1256293539105734816
1256293544323190795
1256293549498961942
1256293554636984332
1256293560278450331
1256293565131260059
1256293570520940647
1256293575558172723
1256293580956500018
1256293586346053674
1256293591513436201
1256293596664037376
1256293601672040612
1256293607003001064
1256293612082298921
1256293616876261407
1256293622408548382
1256293627559153665
1256293632688914442
1256293637831131167
1256293643010965637
1256293648161837088
1256293653480079493
