class Cell
  SHOW = { alive: '@', dead: '-' }.freeze

  attr_accessor :new_state
  attr_reader :symbol
  attr_writer :alive

  def initialize
    @alive = false
    @new_state = false
    @symbol = '-'
  end

  def alive?
    @alive
  end

  def symbol=(value)
    @symbol = SHOW[value]
  end
end
