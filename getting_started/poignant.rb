require_relative '../../webhook/webhook'
using Webhook::DSL

webhook = Webhook.new ENV['RUBY_DISCORD_LIBRARY'] # 1104335299422728262

webhook.patch(1104335299422728262, thread: 1104335299422728262) do
  thread_name "Why's (Poignant) Guide to Ruby"

  content "This. Is. A. Classic. It may not be the most up-to-date regarding "\
          "latest Ruby, but the culture it bestows upon the reader is unmatched."

  embed "Why's (Poignant) Guide to Ruby" do
    url 'https://poignant.guide/'

    thumbnail url: ''

    field name: 'Published', inline: true, value: 'May 2015'
    field name: 'Pages',     inline: true, value: 186
    field name: 'ISBN',      inline: true, value: <<~ISBN
       ISBN-10: ‎1512212938
       ISBN-13: 978-1512212938
    ISBN

    field name: 'Author', value: 'Why the Lucky Stiff'

    field name: 'Get it Here', value: <<~GET
      [Web (free ebook)](https://poignant.guide/book/)
      [Amazon](https://www.amazon.com/whys-poignant-guide-Ruby-color/dp/1512212938)
    GET
  end

  embed 'About' do
    url 'https://poignant.guide/book/'

    field name: 'Read This Paragraph',
         value: "At my local Barnes and Noble, there is a huge wall of Java " \
                "books just waiting to tip over and crush me one day. "       \
                "And one day it will. At the rate things are going, one "     \
                "day that bookcase will be tall enough to crush us all. "     \
                "It might even loop the world several times, crushing "       \
                "previous editions of the same Java books over and over "     \
                "again."


    field name: 'And This Paragraph Too',
         value: "This is just a small Ruby book. It won’t crush you. "        \
                "It’s light as a feather "                                    \
                "(because I haven’t finished it yet—hehe). And there’s a "    \
                "reason this book will stay light: because Ruby is simple "   \
                "to learn."

    field name: "But Don't Read This One",
         value: "_Why’s (Poignant) Guide to Ruby_ is released under the "   \
                "[Attribution-ShareAlike License](http://creativecommons.org/licenses/by-sa/2.5/). " \
                "So, yes, please distribute it and print it and read it "     \
                "leisurely in your housecoat. In fact, there will be a "      \
                "contest at the end of the book for Best Housecoat. "         \
                "It’s a coveted award and you should feel honored to even "   \
                "read about it! (Especially if you are reading about it in "  \
                "your soon-to-be-prize-winning housecoat.)"

    field name: "Now Back to Your Regularly Scheduled Paragraph",
         value: "I’ll try not to feel utterly rejected if this book doesn’t " \
                "capture your fancy. I might experience a few long days of "  \
                "emptiness, accompanied with profuse weeping, but other "     \
                "than that I’ll be fine. It’s at least comforting to know "   \
                "that the following fine texts cover my topic and will "      \
                "doubtless fill you with Ruby lust:\n"                        \
                "\n"                                                          \
                "• [Learning to Program](http://pine.fm/LearnToProgram/)\n"   \
                "• [Programming Ruby](https://ruby-doc.org/docs/ruby-doc-bundle/ProgrammingRuby/index.html)\n" \
                "• [Ruby User's Guide](https://web.archive.org/web/20190714182258/https://www.rubyist.net/~slagell/ruby/)\n" \
                "• [Ruby-Lang.org](http://www.ruby-lang.org/)\n"              \
                "\n"                                                          \
                "Now, if you can't seem to find the contents of the links "   \
                "below, then here’s a link to the [first page](https://poignant.guide/book/chapter-1.html) " \
                "of the (Poignant) Guide."                                    \
                "\n"                                                          \
                "\n"                                                          \
                "Welcome to the pirate radio of technical manuals."

    footer text: "Source: poignant.guide/book/ modified for use on Discord"
  end

  embed 'Table of Contents' do
    description <<~TOC
      1. [About this Book](https://poignant.guide/book/chapter-1.html)
      2. [Kon’nichi wa, Ruby](https://poignant.guide/book/chapter-2.html)
      -- a. [Opening This Book](https://poignant.guide/book/chapter-2.html#section1)
      -- b. [The Dog Story](https://poignant.guide/book/chapter-2.html#section2)
      -- c. [The Red Sun Rises](https://poignant.guide/book/chapter-2.html#section3)
      -- d. [How Books Start](https://poignant.guide/book/chapter-2.html#section4)
      3. [A Quick (and Hopefully Painless) Ride Through Ruby (with Cartoon Foxes)](https://poignant.guide/book/chapter-3.html)
      -- a. [Language and I MEAN Language](https://poignant.guide/book/chapter-3.html#section1)
      -- b. [The Parts of Speech](https://poignant.guide/book/chapter-3.html#section2)
      -- c. [If I Haven't Treated You Like a Child Enough Already](https://poignant.guide/book/chapter-3.html#section3)
      -- d. [An Example to Help You Grow Up](https://poignant.guide/book/chapter-3.html#section4)
      -- e. [And So, The Quick Trip Came To An Eased Cushioned Halt](https://poignant.guide/book/chapter-3.html#section5)
      4. [Floating Little Leaves of Code](https://poignant.guide/book/chapter-4.html)
      -- a. [The Leaf as a Status Symbol in Ambrose](https://poignant.guide/book/chapter-4.html#section1)
      -- b. [Small and Nearly Worthless](https://poignant.guide/book/chapter-4.html#section2)
      -- c. [Chaining Delusions Together](https://poignant.guide/book/chapter-4.html#section3)
      -- d. [The Miracle of Blocks](https://poignant.guide/book/chapter-4.html#section4)
      5. [Them What Make the Rules and Them What Live the Dream](https://poignant.guide/book/chapter-5.html)
      -- a. [This One's For the Disenfranchised](https://poignant.guide/book/chapter-5.html#section1)
      -- b. [A Castle Has Its Computers](https://poignant.guide/book/chapter-5.html#section2)
      -- c. [The Continued Story of My Daughter's Organ Instructor](https://poignant.guide/book/chapter-5.html#section3)
      -- d. [The Goat Wants to Watch a Whole Film](https://poignant.guide/book/chapter-5.html#section4)
      -- e. [The Theft of the Lottery Captain](https://poignant.guide/book/chapter-5.html#section5)
      -- f. [Them What Make the Rules](https://poignant.guide/book/chapter-5.html#section6)
      -- g. [Them What Live the Dream](https://poignant.guide/book/chapter-5.html#section7)
      6. [Downtown](https://poignant.guide/book/chapter-6.html)
      -- a. [If I Were Looking For a Vehicle](https://poignant.guide/book/chapter-6.html#section1)
      -- b. [Meanwhile, The Porcupine Stops To Fill-Up](https://poignant.guide/book/chapter-6.html#section2)
      -- c. [A Sponsored Dragon-Slaying](https://poignant.guide/book/chapter-6.html#section3)
      -- d. [So, Let's Be Clear: The Porcupine Is Now To The Sea](https://poignant.guide/book/chapter-6.html#section4)
      -- e. [Walking, Walking, Walking, Walking and So Forth](https://poignant.guide/book/chapter-6.html#section5)
      -- f. [Just Stopping To Assure You That the Porcupine Hasn't Budged](https://poignant.guide/book/chapter-6.html#section6)
      -- g. [I'm Out](https://poignant.guide/book/chapter-6.html#section7)
      7. [When You Wish Upon a Beard](https://poignant.guide/book/chapter-7.html)

      + Expansion Paks +
      1. [The Tiger's Vest (with a Basic Introduction to Irb)](https://poignant.guide/book/expansion-pak-1.html)

      + See Also +
      1. [Dwemthy's Array](https://poignant.guide/dwemthy/): The official site for the (Poignant) Guide's own MINI_ADVENTURE.
    TOC
  end

  embed do
    image url: ''
  end

  embed do
    description "Last updated: <t:#{Time.now.to_i}:R>"
  end
end
