boards = {
  'Ruby on Remote' => `ruby ~/Ruby/ruby_discord/jobs/rubyonremote/jobs.rb`,
  'Go Rails'       => `ruby ~/Ruby/ruby_discord/jobs/gorails/jobs.rb`,
  'Ruby Central'   => `ruby ~/Ruby/ruby_discord/jobs/rubycentral/jobs.rb`,
  'We Work Remote' => `ruby ~/Ruby/ruby_discord/jobs/weworkremotetly/jobs.rb`,
  'Ruby on Rails'  => `ruby ~/Ruby/ruby_discord/jobs/rubyonrails/jobs.rb`,
}

puts boards.map { |(board, output)| "#{board}:\n#{output}" }
	         .join("=" * 79 + "\n")

