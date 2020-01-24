class Board
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
  end

  def print_matrix
    matrix.each do |row|
      row.each { |cell| select_symbol(cell) }
      print "\n"
    end
  end

  def random_selection
    
  end

  private 

  attr_writer :matrix

  def select_symbol(cell)
    cell.alive? ? cell.symbol = :alive : cell.symbol = :dead
    print cell.symbol
  end
end