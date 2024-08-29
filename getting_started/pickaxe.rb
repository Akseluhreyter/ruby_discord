require_relative '../../webhook/webhook'
using Webhook::DSL

webhook = Webhook.new ENV['RUBY_DISCORD_LIBRARY']

webhook.post do
  thread_name 'Programming Ruby 3.2 (5th Edition)'

  content 'The "pickaxe" series is highly regarded and this entry is no exception!'

  embed 'Programming Ruby 3.2 (5th Edition)' do
    url 'https://pragprog.com/titles/ruby5/programming-ruby-3-2-5th-edition/'

    thumbnail url: ''

    description << "This updated edition describes the language through Ruby 3.2!"

    field name: 'Published', inline: true, value: 'Expected September 2023'
    field name: 'Pages',     inline: true, value: 450
    field name: 'ISBN',      inline: true, value: <<~ISBN
      ISBN-13: 978-1680509823
    ISBN

    field name: 'Get it Here', value: <<~GET
      [The Pragmatic Bookshelf](https://pragprog.com/titles/ruby5/programming-ruby-3-2-5th-edition/)
    GET
  end

  embed 'Table of Contents' do
    description <<~TOC
      Facets of Ruby
      -- Getting Started
      -- Ruby.new [[excerpt](https://media.pragprog.com/titles/ruby5/new.pdf)]
      -- Classes, Objects, and Variables
      -- Collections, Blocks, and Iterators
      -- More About Methods
      -- Sharing Functionality: Inheritance, Modules, and Mixins [[excerpt](https://media.pragprog.com/titles/ruby5/share.pdf)]
      -- Standard Types
      -- Regular Expressions
      -- Expressions
      -- Exceptions
      -- Basic Input and Output
      -- Threads, Fibers, and Ractors
      -- Testing Ruby Code
      Ruby in Its Setting
      -- Ruby from the Command Line [[excerpt](https://media.pragprog.com/titles/ruby5/commandline.pdf)]
      -- Ruby Gems
      -- Interactive Ruby
      -- Debugging Ruby
      -- Typed Ruby [[excerpt](https://media.pragprog.com/titles/ruby5/typed.pdf)]
      -- Documenting Ruby
      Ruby Crystallized
      -- Ruby and the Web
      -- Ruby Style
      -- Metaprogramming
      -- Reflection and Object Space
      Ruby Language Reference
      -- Language Reference: Basic Types and Expressions
      -- Language Reference: Objects and Classes
      Ruby Library Reference
      -- Library Reference: Expressions
      -- Library Reference: Containers
      -- Library Reference: I/O
      -- Library Reference: Core Ruby
      -- Library Reference: Meta Ruby
      Appendixes
      -- But It Doesn't Work!
      -- I Can't Look It Up!
      -- Command-Line Basics
      -- Ruby Runtimes
      -- Ruby Changes
    TOC
  end

  embed do
    description "Last updated: <t:#{Time.now.to_i}:R>"
  end
end
