require 'terminal-table'

message = <<~SECRET.upcase
  Ruby is a language that we programmers adore,
  Unleashing magic spells within its code galore.
  Beneath the haunted moon, its syntax we explore,
  Yet in the world of programming, it thrives even more.

  In the cryptic methods, where eerie bugs may tread,
  Skeletons of errors in the dark are widespread.
  Not a language of the past, but one we hold our heads,
  Over countless projects, where its power has spread.

  The tricks and treats of Ruby, like witches' charms, convene,
  Drawing us into its world, where the sublime is seen.
  Enchanting us with gems, it's every coder's dream,
  Adventures in the code, where the eerie's routine.

  Death may seem to lurk, but for Ruby it's Halloween!
SECRET

encoded = DATA.readlines(chomp: true)

$board1 = [' ', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
          [' ', 'E', 'T', ' ', 'A', ' ', 'O', 'N', ' ', 'R', 'I'],
          ['4', 'B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M'],
          ['2', 'P', 'Q', 'U', 'V', 'W', 'X', 'Y', 'Z', '.', '~'],
          ['7', 'S', ' ', ':', '(', ')', '#', ',', '!', '?', '$']

$board1 = [' ', '0', '1', '2', '3', '4', '5', '6'],
          [' ', 'S', 'C', 'A', 'R', 'Y', '?', '!'],
          ['🎃', 'B', 'D', 'E', 'F', 'G', 'H', ' '],
          ['👻', 'I', 'J', 'K', 'L', 'M', 'N', "'"],
          ['🍬', 'O', 'P', 'Q', 'T', 'U', 'V', ','],
          ['💀', 'W', 'X', 'Z', '.', '#', '$', ':']

table = Terminal::Table.new(rows: $board1, style: {border_x: '=', border_i: '='})

puts table

def encode(message)
  message.each_char.with_object("") do |char, enc|
    $board1[1..].each.with_index(1) do |row, i|
      row[1..].each.with_index(1) do |col, j|
        #next if col == ' ' && j != 2

        if col == char
          enc << $board1[i][0] if i != 1
          enc << $board1[0][j]
        end
      end
    end
  end
end

#abort
message.split("\n").each do |line|
  puts encode(line)
end
#abort

def decode(encoded)
	encoded.map do |line|
  	decoded = ""
  	i = 0

  	while i < line.length
    	case line[i]
    	when '🎃' then decoded << $board1[2][line[i+1].to_i + 1]; i += 2
    	when '👻' then decoded << $board1[3][line[i+1].to_i + 1]; i += 2
    	when '🍬' then decoded << $board1[4][line[i+1].to_i + 1]; i += 2
    	when '💀' then decoded << $board1[5][line[i+1].to_i + 1]; i += 2
    	else          decoded << $board1[1][line[i+0].to_i + 1]; i += 1
    	end
  	end

  	p decoded
	end.collect { _1[0] || " "}.join.then &method(:puts)
end

decode(encoded)

__END__
3🍬4🎃04🎃6👻00🎃62🎃6👻32👻5🎃4🍬42🎃4🎃2🎃6🍬3🎃52🍬3🎃6💀0🎃2🎃6🍬13🍬0🎃432👻4👻4🎃230🎃62🎃1🍬03🎃2🍬6
🍬4👻5👻3🎃220🎃5👻0👻5🎃4🎃6👻42🎃4👻01🎃60🍬1🎃2👻3👻30🎃6💀0👻0🍬3🎃5👻0👻5🎃6👻0🍬30🎃61🍬0🎃1🎃2🎃6🎃42👻3🍬03🎃2💀3
🎃0🎃2👻5🎃22🍬3🎃5🎃6🍬3🎃5🎃2🎃6🎃52🍬4👻5🍬3🎃2🎃1🎃6👻4🍬0🍬0👻5🍬6🎃6👻0🍬30🎃604👻5🍬32💀1🎃6💀0🎃2🎃6🎃2💀1🍬1👻3🍬03🎃2🍬6
4🎃2🍬3🎃6👻0👻5🎃6🍬3🎃5🎃2🎃6💀0🍬03👻3🎃1🎃6🍬0🎃3🎃6🍬13🍬0🎃432👻4👻4👻0👻5🎃4🍬6🎃6👻0🍬3🎃6🍬3🎃53👻0🍬5🎃20🎃6🎃2🍬5🎃2👻5🎃6👻4🍬03🎃2💀3

👻0👻5🎃6🍬3🎃5🎃2🎃6134🍬1🍬3👻01🎃6👻4🎃2🍬3🎃5🍬0🎃10🍬6🎃6💀0🎃5🎃23🎃2🎃6🎃2🎃23👻0🎃2🎃6🎃0🍬4🎃40🎃6👻424🎃6🍬33🎃22🎃1🍬6
0👻2🎃2👻3🎃2🍬3🍬0👻50🎃6🍬0🎃3🎃6🎃233🍬030🎃6👻0👻5🎃6🍬3🎃5🎃2🎃6🎃123👻2🎃623🎃2🎃6💀0👻0🎃1🎃20🍬13🎃22🎃1💀3

👻5🍬0🍬3🎃62🎃6👻32👻5🎃4🍬42🎃4🎃2🎃6🍬0🎃3🎃6🍬3🎃5🎃2🎃6🍬120🍬3🍬6🎃6🎃0🍬4🍬3🎃6🍬0👻5🎃2🎃6💀0🎃2🎃6🎃5🍬0👻3🎃1🎃6🍬0🍬43🎃6🎃5🎃22🎃10🍬6
🍬0🍬5🎃23🎃61🍬0🍬4👻5🍬3👻3🎃200🎃6🍬13🍬0👻1🎃21🍬30🍬6🎃6💀0🎃5🎃23🎃2🎃6👻0🍬30🎃6🍬1🍬0💀0🎃23🎃6🎃520🎃60🍬13🎃22🎃1💀3
🍬3🎃5🎃2🎃6🍬33👻01👻20🎃62👻5🎃1🎃6🍬33🎃22🍬30🎃6🍬0🎃3🎃63🍬4🎃04🍬6🎃6👻3👻0👻2🎃2🎃6💀0👻0🍬31🎃5🎃20👻6🎃61🎃523👻40🍬6🎃61🍬0👻5🍬5🎃2👻5🎃2🍬6

🎃132💀0👻0👻5🎃4🎃6🍬40🎃6👻0👻5🍬3🍬0🎃6👻0🍬30🎃6💀0🍬03👻3🎃1🍬6🎃6💀0🎃5🎃23🎃2🎃6🍬3🎃5🎃2🎃60🍬4🎃0👻3👻0👻4🎃2🎃6👻00🎃60🎃2🎃2👻5💀3
🎃2👻51🎃52👻5🍬3👻0👻5🎃4🎃6🍬40🎃6💀0👻0🍬3🎃5🎃6🎃4🎃2👻40🍬6🎃6👻0🍬3👻60🎃6🎃2🍬5🎃234🎃61🍬0🎃1🎃23👻60🎃6🎃13🎃22👻4🍬6
2🎃1🍬5🎃2👻5🍬3🍬43🎃20🎃6👻0👻5🎃6🍬3🎃5🎃2🎃61🍬0🎃1🎃2🍬6🎃6💀0🎃5🎃23🎃2🎃6🍬3🎃5🎃2🎃6🎃2🎃23👻0🎃2👻60🎃63🍬0🍬4🍬3👻0👻5🎃2💀3
🎃1🎃22🍬3🎃5🎃6👻424🎃60🎃2🎃2👻4🎃6🍬3🍬0🎃6👻3🍬43👻2🍬6🎃6🎃0🍬4🍬3🎃6🎃3🍬03🎃63🍬4🎃04🎃6👻0🍬3👻60🎃6🎃52👻3👻3🍬0💀0🎃2🎃2👻56
