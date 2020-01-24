class Board
  attr_reader :size, :matrix

  def initialize(size)
    @size = size
    @matrix = []
  end

  private 

  attr_writer :matrix
end