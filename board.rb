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
      row.each { |cell| print cell.symbol }
      print "\n"
    end
  end

  def random_selection
    
  end

  private 

  attr_writer :matrix
end