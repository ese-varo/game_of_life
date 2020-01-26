class Board
  PERCENTAGE = 0.01
  attr_reader :size, :matrix

  def initialize(size)
    @size = size
    @matrix = []
  end

  def fill
    size.times do |x|
      matrix.push([])
      size.times { |y| matrix[x][y] = Cell.new }
    end
    random_selection
  end

  def print_matrix
    validate_cells
    system "clear"
    matrix.each do |row|
      row.each { |cell| select_symbol(cell) }
      print "\n"
    end
    puts "Press \"ctrl + z\" to quit the game "
  end

  private 

  attr_writer :matrix

  def select_symbol(cell)
    cell.alive? ? cell.symbol = :alive : cell.symbol = :dead
    print "#{cell.symbol} "
  end

  def random_selection
    ((size ** 2) * PERCENTAGE).to_i.times do 
      x = rand(0..(size - 1))
      y = rand(0..(size - 1))
      matrix[x][y].alive = true
    end
  end

  def validate_cells
    matrix.each_with_index do |row, x|
      row.each_with_index { |cell, y| count_neighbors(x, y) }
    end
  end

  def count_neighbors(x, y)
    count = 0
    count += top_row(x, y)
    count += mid_row(x, y)
    count += bottom_row(x, y)
    determine_new_state(count) 
  end

end