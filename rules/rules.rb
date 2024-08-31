require 'discord_webhook/dsl'

webhook = DiscordWebhook.new ENV['RUBY_DISCORD_RULES']

webhook.patch(1105291746360967219) do
  content is: "Please have embeds enabled to view the rules"

  attach file: '../assets/emoji/1f60e.png'
  attach file: '../assets/emoji/1f6ab.png'
  attach file: '../assets/emoji/2696.png'
  attach file: '../assets/emoji/1f645-200d-2640-fe0f.png'
  attach file: '../assets/emoji/1f575.png'
  attach file: '../assets/emoji/1f4f0.png'
  attach file: '../assets/emoji/1f468-200d-1f4bc.png'
  attach file: '../assets/emoji/1f64b.png'
  attach file: '../assets/emoji/1f964.png'

  embed title: "Rule 1: Be Respectful" do
    thumbnail url: 'attachment://1f60e.png'

    color is: 0x23272A

    description is: "Being kind and respectful is coolest thing someone can be. " \
                    "Don't be rude or spread hate. It's not cool. "               \
                    "**You will be banned** if the offense is serious enough. "   \
  end

  embed title: "Rule 2: No NSFW" do
    thumbnail url: 'attachment://1f6ab.png'

    color is: 0xED4245

    description is: "Please don't post lewd, dark, or potentially offensive " \
                    "material of any kind. It will be removed. "              \
                    "You will be banned for serious or repeated offenses."
  end

  embed title: "Rule 3: Report Concerns to Admins" do
    thumbnail url: 'attachment://2696.png'

    color is: 0xFEE75C

    # admin id: <@&802764844155273266>
    # staff channel id: <#1138581024389992468>
    description is: "Please create a ticket in the ⁠<#1138581024389992468> channel or directly message the <@&802764844155273266>."
  end

  embed title: "Rule 4: Do Not Crosspost" do
    thumbnail url: 'attachment://1f645-200d-2640-fe0f.png'

    color is: 0xFEE75C

    description is: "Make posts to the most appropriate channel. "             \
                    "Crossposting **will not** get you more help. "            \
                    "It **will** confuse and frustrate those "                 \
                    "wanting to help you. Crossposting makes it difficult to " \
                    "determine what solutions have been attempted or recommended."
  end

  embed title: "Rule 5: Do Not Solicit Members in DMs" do
    thumbnail url: 'attachment://1f575.png'

    color is: 0xFEE75C

    description is: "Use the support channels when asking for help. "             \
                    "If a member is available, they'll see your messages in the " \
                    "support channels."                                           \
  end

  embed title: "Rule 6: Promote in the Appropriate Channels" do
    thumbnail url: 'attachment://1f4f0.png'

		color is: 0x57F287

    description is: "If you have something to share, please use the most appropriate channel."

    field name: "__<#1119458433108815923> & <#1187814365131456612>__", inline: true, value: <<~JOBS
      - Job Positions
      - Internships
      - Freelancing
      - Contract Work
      - etc...
    JOBS

    field name: "__<#519951147931271169>__", inline: true, value: <<~LOOK
      - Gem Releases
      - Events
      - Community Announcements
      - Articles or Blog Posts
      - Deals/Promotions
      - Seeking Contributors
      - Seeking Project Feedback
      - etc...
    LOOK

    field name: "Note",
         value: "Bad faith posts like scams or grifts **__will__** result in moderator action."

  end

  embed title: "Rule 7: Format Code" do
    thumbnail url: 'attachment://1f468-200d-1f4bc.png'

    color is: 0x57F287

    description is: "They say presentation is everything. "         \
                    "Use code blocks to better present your code! " \
                    "The easier it is to read and run your code, "  \
                    "the more likely someone will help."

    field name: "Do This...", inline: true, value: <<~VALUE
      \\`\\`\\`ruby
      puts 'Hello, Ruby!'
      \\`\\`\\`
    VALUE

    field name: "To Make This", inline: true, value: <<~VALUE
      ```ruby
      puts 'Hello, Ruby!'
      ```
    VALUE

    field name: "Alternative Options", value: <<~VALUE
      • [Gist](https://gist.github.com)
      • [Pastebin](https://pastebin.com/)
      • [Hastebin](https://www.toptal.com/developers/hastebin)
      • [0bin](https://0bin.net/)
    VALUE
  end

  embed title: "Rule 8: Don't Ask to Ask" do
    color is: 0x57F287 and url is: 'https://dontasktoask.com/'

    thumbnail url: 'attachment://1f64b.png'

    description is: "You don't have to \"ask to ask\". " \
                    "Please feel free to directly ask your question."

    field name: "How to Ask Good Questions", value: <<~VALUE
      - Explain the problem
      - Don't use screenshots
      - Share what you have tried
      - State expected vs. actual results
      - Provide an example
      - Be polite and patient
    VALUE
  end

  embed title: "Rule 9: Drink Water" do
    thumbnail url: 'attachment://1f964.png'

    color is: 0x3498DB

    description is: <<~NICE
      Be Healthy.
      Take Breaks.
      Make Progress, Not Perfection.

      You're Worth It. :heart:
    NICE
  end
end

# Old version of the Ruby Discord's Server rules below
__END__
Ruby Discord Rules
We have some rules on the server. Please read over them and follow them, the rules are here for a reason!
0. Not knowing the rules isn't an excuse.
1. Be a decent human being. Don't spread negativity, shitpost, or be overly rude/insulting. (This also means no politics, as it always devolves and ends up hurting one person or another.) We're all here because we love Ruby, and we don't want to have a bad time.
2. No NSFW, racism, sexism, ageism, (any of the -isms really), hate speech, etc. You'll get kicked, and if the behaviour continues/is bad enough, banned.
3. Please, feel free to ask your question. You don't have to "ask to ask"; just jump right into your question!
(Learn more: https://dontasktoask.com/). However, do not solicit help from members in direct messages without their consent.
4. Please dm any @Admins with any concerns you have.
5. Please post topics in their appropriate channels: The channel names and descriptions are a good guide. After all, if you post something in the wrong place, people there won't know how to help.
6. No advertising other discord servers unless it makes sense in the conversation.
7. When pasting more than one line of code, PLEASE surround it with backticks (`—the character on the ~ key) and mark it as ruby code:
```ruby
puts "Hello, world!"
puts "Yay ruby!"
```
Which produces:
puts "Hello, world!"
puts "Yay ruby!"

If your code's longer than ≈20-25 lines, please post a link to your code. Gist GitHub is a decent source, so is Pastebin.
8. Go to the ⁠roles-👥 channel to claim a role!
9. If you notice someone breaking rules, ping a @Admins.
10. Remember to drink lots of water! (edited)
