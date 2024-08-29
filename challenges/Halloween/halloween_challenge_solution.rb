###############################################################################
# Title:  Halloween Challenge Solution
# Author: 143crimson
# Date:   2023/10/23
#
# This challenge involves deciphering a mysterious message, which,
# when successfully decrypted,reveals a spooky poem.
#
# The poem can be recovered straightforwardly by iterating over each line
# of the encrypted message and building the poem char by char.
#
# The board enciphers a character into one of two possible representations.
# If a character is found on the top row, the character is enciphered into the
# corresponding column number. Any other row and the character is enciphered
# into the corresponding row emoji and the column number.
#
# For example, "RUBY" is enciphered as "3🍬4🎃04".
# R => 3, U => 🍬4, B => 🎃0, Y => 4
#
# Undoing this process yields the poem.
###############################################################################
BOARD = [' ', '0', '1', '2', '3', '4', '5', '6'],
        [' ', 'S', 'C', 'A', 'R', 'Y', '?', '!'],
        ['🎃', 'B', 'D', 'E', 'F', 'G', 'H', ' '],
        ['👻', 'I', 'J', 'K', 'L', 'M', 'N', "'"],
        ['🍬', 'O', 'P', 'Q', 'T', 'U', 'V', ','],
        ['💀', 'W', 'X', 'Z', '.', '#', '$', ':']

message = DATA.readlines(chomp: true)

# Transform the message line by line. Each line walked in a "one-pointer"
# style. If an emoji is read, then read the next char to get the column.
# Otherwise, the row is the first and the column is the read value plus one.
# The "pointer" is advanced accordingly to find the next char.
poem = message.map do |line|
  decoded = ""

  i = 0
  while i < line.length
    case line[i]
    when '🎃' then decoded << BOARD[2][line[i+1].to_i + 1]; i += 2
    when '👻' then decoded << BOARD[3][line[i+1].to_i + 1]; i += 2
    when '🍬' then decoded << BOARD[4][line[i+1].to_i + 1]; i += 2
    when '💀' then decoded << BOARD[5][line[i+1].to_i + 1]; i += 2
    else           decoded << BOARD[1][line[i+0].to_i + 1]; i += 1
    end
  end

  decoded
end

# The hidden message is found by reading the first character on each line.
hidden = poem.collect { _1[0] || " "}.join

puts poem
puts
puts "Hidden Message: #{hidden}"

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
