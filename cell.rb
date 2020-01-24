class Cell
  attr_accessor :new_state
  attr_reader :symbol
  attr_writer :alive

  def initialize
    @show = {alive: "@", dead: "-"}
    @alive = false
    @new_state = false
    @symbol = "-" 
  end

  def alive?
    @alive
  end

  def symbol=(value)
    @symbol = show[value] 
  end

  private

  attr_reader :show
end