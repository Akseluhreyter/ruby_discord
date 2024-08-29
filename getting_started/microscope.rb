require_relative '../../webhook/webhook'
using Webhook::DSL

webhook = Webhook.new ENV['RUBY_DISCORD_LIBRARY']

webhook.post do
  thread_name 'Ruby Under a Microscope (RUM)'

  content "Ruby Under a Microscope will guide you through Ruby's interals "   \
          "like no other can!"

  embed 'Ruby Under a Microscope (RUM)' do
    url 'https://patshaughnessy.net/ruby-under-a-microscope'

    thumbnail url: ''

    description "Don't know C but interested in Ruby magic? No problem! "     \
                "Ruby Under a Microscope (RUM) is the book for you. RUM "     \
                "doesn't just tell you how Ruby works, it teaches you the "   \
                "tools to prove it to yourself."

    field name: 'Published', inline: true, value: '2013'
    field name: 'Pages',     inline: true, value: 360
    field name: 'ISBN',      inline: true, value: <<~ISBN
      ISBN-13: 978-1593275273
    ISBN

    field name: 'Get it Here', value: <<~GET
      [No Starch Press](https://nostarch.com/rum)
    GET
  end

  embed 'Table of Contents' do
    description <<~TOC
      Foreword by Aaron Patterson
      Acknowledgments
      Introduction
      Chapter 1: Tokenization and Parsing
      Chapter 2: Compilation
      Chapter 3: How Ruby Executes Your Code
      Chapter 4: Control Structures and Method Dispatch
      Chapter 5: Objects and Classes
      Chapter 6: Method Lookup and Constant Lookup
      Chapter 7: The Hash Table: The Workhorse of Ruby Internals
      Chapter 8: How Ruby Borrowed a Decades-Old Idea from Lisp
      Chapter 9: Metaprogramming
      Chapter 10: JRuby: ruby on the JVM
      Chapter 11: Rubinius: Ruby Implemented with Ruby
      Chapter 12: Garbage Collection in MRI, JRuby, and Rubinius
      Index
    TOC
  end

  embed do
    description "Last updated: <t:#{Time.now.to_i}:R>"
  end
end
