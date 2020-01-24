class Board
  PERCENTAGE = 0.05
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
    system "clear"
    matrix.each do |row|
      row.each { |cell| select_symbol(cell) }
      print "\n"
    end
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
end