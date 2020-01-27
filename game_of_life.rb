# rules
# any live cell with two or three neighbors survives 
# any dead cell with three live neighbors becomes a live cell
# all other live cells die in the next generation. 
# Similarly, all other dead cells stay dead
require_relative "board"          
require_relative "cell"

def play_game
  puts "Please enter the number of rows for creating the board: "
  board = Board.new(gets.chomp.to_i)
  board.fill
  while true
    board.print_matrix
    sleep 1
  end
end

play_game
