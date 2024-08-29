require 'json'
require 'net/http'

require_relative '../../webhook/webhook'

using Webhook::DSL

webhook = Webhook.new(ENV['RUBY_DISCORD_CHALLENGES'])

webhook.post do
  embed 'Halloween Challenge Winners' do
  	color 0xE67E22
    thumbnail url: 'attachment://1f3c6.png'

    field name: "🎃", value: <<~WINNERS, inline: true
      1. <@357597507221717003>
      2. <@654212907105517579>
      3. <@619941705159802900>
      4. <@188666521415974912>
      5. <@596825245327949833>
    WINNERS

    field name: "👻", value: <<~WINNERS, inline: true
      6.  <@311321797469536266>
      7.  <@586808226058862623>
      8.  <@274623754984882177>
      9.  <@437714089649766412>
      10. <@105861263254380544>
    WINNERS

    field name: "🍬", value: <<~WINNERS, inline: true
      11. <@282168250597507072>
      12. <@261097506711142400>
      13. <@768182477449592832>
      14. <@719255892813545502>
      15. <@325194829959266304>
    WINNERS
  end

  #attachment do |a|
  #  a.filename = "halloween_challenge_solution.rb"
  #  a.description = "Solution for the Halloween Challenge."
  #end

  attachment do |a|
    a.filename = "1f3c6.png"
    a.description = "Trophy emoji to be used as embed thumbnail"
  end
end
