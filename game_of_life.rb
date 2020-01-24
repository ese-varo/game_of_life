require_relative "board"          
require_relative "cell"

puts "Please enter the number of rows for creating the board: "
board = Board.new(gets.chomp.to_i)
board.fill
board.print_matrix

