class Board
  PERCENTAGE = 28
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
    # init_blinker
    # init_toad
  end

  def print_matrix
    system 'clear'
    matrix.each do |row|
      row.each { |cell| select_symbol(cell) }
      print "\n"
    end
    puts 'Press \"ctrl + z\" to quit the game '
    validate_cells
  end

  private

  attr_writer :matrix

  def select_symbol(cell)
    cell.symbol = cell.alive? ? :alive : :dead
    print "#{cell.symbol} "
  end

  def random_selection
    (size**2 * (PERCENTAGE * 0.01)).to_i.times { live_cells }
  end

  def live_cells
    x = rand(0..(size - 1))
    y = rand(0..(size - 1))
    matrix[x][y].alive = true
  end

  def validate_cells
    matrix.each_with_index do |row, x|
      row.each_with_index { |_cell, y| determine_new_state(x, y) }
    end
    set_new_state
  end

  def set_new_state
    size.times do |x|
      size.times { |y| matrix[x][y].alive = matrix[x][y].new_state }
    end
  end

  def determine_new_state(x_ind, y_ind)
    neighbors = count_neighbors(x_ind, y_ind)
    matrix[x_ind][y_ind].new_state = apply_rules(x_ind, y_ind, neighbors)
  end

  def count_neighbors(x_index, y_index)
    count = 0
    count += top_row(x_index, y_index)
    count += mid_row(x_index, y_index)
    count += bottom_row(x_index, y_index)
    count
  end

  def apply_rules(x_index, y_index, neighbors)
    if matrix[x_index][y_index].alive?
      return true if neighbors > 1 && neighbors < 4
    elsif neighbors == 3
      return true
    end

    false
  end

  def top_row(x_index, y_index)
    x_index -= 1
    y_index -= 1
    counter = 0
    3.times do |i|
      counter += dead?(x_index, y_index + i) if exists?(x_index, y_index + i)
    end
    counter
  end

  def mid_row(x_index, y_index)
    counter = 0
    counter += dead?(x_index, y_index - 1) if exists?(x_index, y_index - 1)
    counter += dead?(x_index, y_index + 1) if exists?(x_index, y_index + 1)
    counter
  end

  def bottom_row(x_index, y_index)
    x_index += 1
    y_index -= 1
    counter = 0
    3.times do |i|
      counter += dead?(x_index, y_index + i) if exists?(x_index, y_index + i)
    end
    counter
  end

  def exists?(x_index, y_index)
    return false if x_index.negative? || matrix[x_index].nil?
    return false if y_index.negative? || matrix[x_index][y_index].nil?

    true
  end

  def dead?(x_index, y_index)
    matrix[x_index][y_index].alive? ? 1 : 0
  end

  # methods to fill the board with known patterns
  def init_toad
    x = 2
    iy = 2
    2.times do
      3.times { |y| matrix[x][y + iy].alive = true }
      x += 1
      iy -= 1
    end
  end

  def init_blinker
    3.times { |y| matrix[2][y + 1].alive = true }
  end
end
