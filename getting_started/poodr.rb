require_relative '../../webhook/webhook'
using Webhook::DSL

webhook = Webhook.new ENV['RUBY_DISCORD_LIBRARY']

webhook.post do
  thread_name 'Practical Object-Oriented Design in Ruby (POODR)'

  content 'POODR explains object-oriented design (OOD) in a practical, '      \
          'readable manner.'

  embed 'Practical Object-Oriented Design in Ruby (POODR)' do
    url 'https://www.poodr.com/'

    thumbnail url: ''

    description "If you have a grasp of Ruby but feel like you're no longer " \
                'improving, this is a great read to level up your problem '   \
                'solving skills with Ruby.'

    field name: 'Published', inline: true, value: 'July 2018'
    field name: 'Pages',     inline: true, value: 288
    field name: 'ISBN',      inline: true, value: <<~ISBN
      ISBN-10: 0134456475
      ISBN-13: 978-0134456478
    ISBN

    field name: 'Get it Here', value: <<~GET
      [Amazon](https://www.amazon.com/gp/product/0134456475)
      [Informit](https://www.informit.com/store/practical-object-oriented-design-an-agile-primer-using-9780134456478)
    GET
  end

  embed 'Table of Contents' do
    description <<~TOC
      Introduction xv
      Acknowledgements xix
      About the Author xxi
      Chapter 1: Object-Oriented Design
      -- 1.1 In Praise of Design 2
      -- 1.2 The Tools of Design 4
      -- 1.3 The Act of Design 6
      -- 1.4 A Brief Introduction to Object-Oriented Programming 10
      -- 1.5 Summary 13
      Chapter 2: Designing Classes with a Single Responsibility 15
      -- 2.1 Deciding What Belongs in a Class 16
      -- 2.2 Creating Classes That Have a Single Responsibility 17
      -- 2.3 Writing Code That Embraces Change 24
      -- 2.4 Finally, the Real Wheel 33
      -- 2.5 Summary 35
      Chapter 3: Managing Dependencies 37
      -- 3.1 Understanding Dependencies 38
      -- 3.2 Writing Loosely Coupled Code 41
      -- 3.3 Managing Dependency Direction 53
      -- 3.4 Summary 59
      Chapter 4: Creating Flexible Interfaces 61
      -- 4.1 Understanding Interfaces 61
      -- 4.2 Defining Interfaces 63
      -- 4.3 Finding the Public Interface 65
      -- 4.4 Writing Code That Puts Its Best (Inter)Face Forward 77
      -- 4.5 The Law of Demeter 80
      -- 4.6 Summary 84
      Chapter 5: Reducing Costs with Duck Typing 85
      -- 5.1 Understanding Duck Typing 85
      -- 5.2 Writing Code That Relies on Ducks 95
      -- 5.3 Conquering a Fear of Duck Typing 100
      -- 5.4 Summary 103
      Chapter 6: Acquiring Behavior through Inheritance 105
      -- 6.1 Understanding Classical Inheritance 105
      -- 6.2 Recognizing Where to Use Inheritance 106
      -- 6.3 Misapplying Inheritance 114
      -- 6.4 Finding the Abstraction 116
      -- 6.5 Managing Coupling between Superclasses and Subclasses 129
      -- 6.6 Summary 139
      Chapter 7: Sharing Role Behavior with Modules 141
      -- 7.1 Understanding Roles 142
      -- 7.2 Writing Inheritable Code 158
      -- 7.3 Summary 161
      Chapter 8: Combining Objects with Composition 163
      -- 8.1 Composing a Bicycle of Parts 163
      -- 8.2 Composing the Parts Object 168
      -- 8.3 Manufacturing Parts 176
      -- 8.4 The Composed Bicycle 181
      -- 8.5 Deciding between Inheritance and Composition 185
      -- 8.6 Summary 191
      Chapter 9: Designing Cost-Effective Tests 193
      -- 9.1 Intentional Testing 194
      -- 9.2 Testing Incoming Messages 202
      -- 9.3 Testing Private Methods 215
      -- 9.4 Testing Outgoing Messages 217
      -- 9.5 Testing Duck Types 221
      -- 9.6 Testing Inherited Code 233
      -- 9.7 Summary 244
      Afterword 245
      Index 247
    TOC
  end

  embed do
    description "Last updated: <t:#{Time.now.to_i}:R>"
  end
end
