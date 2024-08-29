require 'discord_webhook'

webhook = DiscordWebhook.new ENV["RUBY_DISCORD_SEEKING"]

request = {
  :payload_json => {
    :content => "Please have embeds enabled to see the following:",
    :embeds => [{
      :color => 0xCC342D,
      :title => "Résumé Rules",
      :thumbnail => {
        :url => "attachment://1faa7.png",
      },
      :description => "When posting in this channel please obey the following rules:\n"                \
                      "- **Résumés should reflect an interest in Ruby or your experience with it.**\n" \
                      "- **Only share your résumé once per week.**\n"                                  \
                      "Failure to comply with these rules may result in moderator action.",           
      :footer => {
        :text => "This message is shared periodically and is not in response to any particular message.",
      },
    }],
  },
  :attachments => [{:id => 0, :filename => "1faa7.png"}],
  :files       => [File.read("../../assets/emoji/1faa7.png")],
}

webhook.post request
