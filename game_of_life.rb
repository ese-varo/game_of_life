# rules
# any live cell with two or three neighbors survives
# any dead cell with three live neighbors becomes a live cell
# all other live cells die in the next generation.
# Similarly, all other dead cells stay dead
require_relative 'board'
require_relative 'cell'

def play_game
  puts 'Please enter the number of rows for creating the board: '
  size = gets.chomp.to_i
  size > 2 ? board = Board.new(size) : play_game
  # blinker_size = 5
  # toad_size = 6
  # board = Board.new(blinker_size)
  board.fill
  loop do
    board.print_matrix
    sleep 1
  end
end

play_game
