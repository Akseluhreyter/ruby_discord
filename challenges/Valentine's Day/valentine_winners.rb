require 'discord_webhook/dsl'

# Server News
#webhook = Webhook.new ENV['RUBY_SERVER_NEWS']

# Challenges
webhook = Webhook.new ENV['RUBY_DISCORD_CHALLENGES']

webhook.post do
  #content is: "Good morning <@&846844961253359626> and <@&894682903081021520>! "                          \
  #            "The [Wireworld Valentine Challenge]"                                                       \
  #            "(https://discord.com/channels/518658712081268738/829182376524513280/1203174121882783804) " \
  #            "is now closed. Please take a moment to congratulate the "                                  \
  #            "<@&1202469176795602985>s listed below and check out "                                      \
  #            "their solutions!" 

  embed title: ':sparkling_heart: Wireworld Valentine Winners :sparkling_heart:' do
    color is: 0xd41f3a and thumbnail url: 'attachment://1f3c6.png'

    field name: '', value: <<~GROUP1, inline: true
      1. <@619941705159802900> | [solution](https://pastebin.com/jCC9YVGq)
      2. <@654212907105517579> | [solution](https://gist.github.com/ParadoxV5/71ca53b9e4b5efe1692cd767486bc5d1)
      3. <@719255892813545502> | [solution](https://pastebin.com/gtX9yY1Y)
      4. <@325194829959266304> | [solution](https://github.com/FyendFyre/ruby-valentine-challange)
      5. <@143908724719747073> | [solution](https://gist.github.com/hollow-hunter/7fc761bb8bd69ae1a341a24bb04619f9)
    GROUP1

    field name: '', value: <<~GROUPTWO, inline: true
      6. <@583414707776389324> | [solution](https://github.com/darksaoixus/wireworld-valentine-challenge)
      7. <@127145467510259723> | [solution](https://pastebin.com/26HAXLQn)
      8. <@768182477449592832> | [solution](https://gist.github.com/4hg/6ce2fa0ff327cbc80ab0518e88d4799f)
      9. <@414959574416621598> | [solution](https://github.com/MclPio/valentines_wireworld)
      10. <@648633396230225943> | [solution](https://github.com/CTC97/ruby_wireworld)
    GROUPTWO
  end

  #mention roles: [
  #  '846844961253359626',
  #  '894682903081021520',
  #  '1202469176795602985',
  #]

  attach filename: '../../assets/emoji/1f3c6.png'
end
