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
      row.each_with_index { |cell, y| determine_new_state(x, y) }
    end
  end

  def determine_new_state(x, y)
    neighbors = count_neighbors(x, y)
    matrix[x][y].new_state = apply_rules(x, y, neighbors)
  end

  def count_neighbors(x, y)
    count = 0
    count += top_row(x, y)
    count += mid_row(x, y)
    count += bottom_row(x, y)
    count
  end

  def apply_rules(x, y, neighbors)
    if matrix[x][y].alive? 
      return true if neighbors > 1 && neighbors < 4
    else
      return true if neighbors == 3
    end
    false
  end

  def top_row(x, y)
    x, y = x - 1, y - 1
    counter = 0
    3.times { |i| counter += is_alive(x, y - i) if exists?(x, y - i) }
    counter
  end

  def mid_row(x, y)
    counter = 0
    counter += is_alive(x, y - 1) if exists?(x, y - 1)
    counter += is_alive(x, y + 1) if exists?(x, y + 1)
    counter
  end

  def bottom_row(x, y)
    x, y = x + 1, y - 1
    counter = 0
    3.times { |i| counter += is_alive(x, y + i) if exists?(x, y + i) }
  end

  def exists?(x, y)
    if x < 0 || matrix[x].nil?
      return false
    elsif y < 0 || matrix[x][y].nil?
      return false
    end
    true
  end

  def is_alive(x, y)
    matrix[x][y].alive? ? 1 : 0
  end
end