require 'discord_webhook'

challenges  = DiscordWebhook.new ENV['RUBY_DISCORD_CHALLENGES']
server_news = DiscordWebhook.new ENV['RUBY_DISCORD_SERVER_NEWS']

request = {
  :content => "Good evening, <@&846844961253359626> and <@&894682903081021520>!\n\nThe [Jurassic Summer Challenge](https://discord.com/channels/518658712081268738/829182376524513280/1253552648515223594) is now closed. " \
              "Please take a moment to congratulate the <@&1249183653066575903> listed below and be sure to check out their solutions!\n",
  :embeds => [{
    :title => ':palm_tree: :sauropod: Jurassic Summer Challenge 2024 Winners :t_rex: :palm_tree:',
    :color => 0x57F287,
    :thumbnail => {
      :url => 'attachment://1f3c6.png'
    },
    :fields => [{
      :name => '',
      :value => "1. <@654212907105517579> | [solution](https://gist.github.com/ParadoxV5/41dc664630f70a2a3400d39d09ecfb89)\n" \
                "2. <@768182477449592832> | [solution](https://gist.github.com/4hg/8ca33696cf74f92596b839aa492324e8)\n"       \
                "3. <@619941705159802900> | [solution](https://pastebin.com/tscCsjcF)\n" 
    }]
  }],
  :allowed_mentions => {
      :roles => [
        "846844961253359626",
        "894682903081021520",
        "1249183653066575903",
      ]
    },
  :attachments => [
    {:id => 0, :filename => '1f3c6.png', :description => 'Rawr! :trophy:'},
  ],
  :files => [
    File.read('../../assets/emoji/1f3c6.png'),
  ]
}

#server_news.post(request)
#request.delete(:content)
#challenges.post(request)

server_news.patch(1258944272992833557, request)
