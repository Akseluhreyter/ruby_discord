require 'discord_webhook/dsl'

webhook = DiscordWebhook.new ENV['RUBY_DISCORD_LIBRARY']

webhook.post do
  flags is: 4
  
  content is: <<~BOOKS
    # :books: __Books__
    ### Beginner
    - [Why's (Poignant) Guide to Ruby](https://poignant.guide/book/)
    - [Learn to Program](https://pine.fm/LearnToProgram/)
    - [Programming Ruby 3.3](https://pragprog.com/titles/ruby5/programming-ruby-3-3-5th-edition/)
    - [The Well-Grounded Rubyist](https://www.manning.com/books/the-well-grounded-rubyist-third-edition)
    ### Adept
    - [Polished Ruby Programming](https://www.packtpub.com/product/polished-ruby-programming/9781801072724)
    - [Practical OOD in Ruby (POODR)](https://www.poodr.com/)
    ### Expert
    - [Metaprogramming](https://pragprog.com/titles/ppmetr2/metaprogramming-ruby-2/)
    - [Ruby Under a Microscope (RUM)](https://patshaughnessy.net/ruby-under-a-microscope)
  BOOKS
end

webhook.post do
  flags is: 4
  
  content is: <<~DOCS
    # :page_facing_up: __Documentation__
    - [Official Ruby Documentation](https://docs.ruby-lang.org)
    - [ruby-doc.org](https://www.ruby-doc.org/)
    - [DevDocs.io](https://devdocs.io/ruby/)
    - [rubydoc.info](https://www.rubydoc.info/)
    - [rubyapi.org](https://rubyapi.org/)
  DOCS
end

webhook.post do
  flags is: 4
  
  content is: <<~STYLE
    # :dancer: __Style Guides__
    - [rubystyle.guide](https://rubystyle.guide/)
    - [RuboCop](https://github.com/rubocop/ruby-style-guide)
    - [Shopify](https://ruby-style-guide.shopify.dev/)
    - [GitLab](https://docs.gitlab.com/ee/development/backend/ruby_style_guide.html)
    - [Airbnb](https://github.com/airbnb/ruby)
    - [w3resource](https://www.w3resource.com/ruby/ruby-style-guide.php)
  STYLE
end

webhook.post do
  flags is: 4
  
  content is: <<~REF
    # :bookmark: __References__
    - [Ruby QuickRef](https://www.zenspider.com/ruby/quickref.html)
    - [rubyreferences](https://rubyreferences.github.io/)
  REF
end

webhook.post do
  flags is: 4
  
  content is: <<~TOOLS
    # :tools: __Tools__
    - [IRB](https://github.com/ruby/irb)
    - [Pry](https://github.com/pry/pry)
    - [Rake](https://github.com/ruby/rake)
    - [RI](https://ruby.github.io/rdoc/RI_rdoc.html)
    - [RBS](https://github.com/ruby/rbs)
    - [TypeProf](https://github.com/ruby/typeprof)
    - [Steep](https://github.com/soutaro/steep)
  TOOLS
end

webhook.post do
  flags is: 4
  
  content is: <<~TUT
    # :teacher: __Tutorials__
    - [TryRuby](https://try.ruby-lang.org/)
    - [Ruby in Twenty Minutes](https://www.ruby-lang.org/en/documentation/quickstart/)
    - [RubyKoans](http://rubykoans.com/)
    - [The Odin Project](https://www.theodinproject.com/)
    - [excercism](https://exercism.org/tracks/ruby)
    - [Codecademy](https://www.codecademy.com/learn/learn-ruby)
  TUT
end

