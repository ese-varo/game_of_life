class Cell
  attr_accessor :new_state
  attr_reader :symbol

  def initialize
    @symbols = {alive: "@", dead: "-"}
    @alive = false
    @new_state = false
    @symbol = "-" 
  end

  def alive=(value)
    @current_state = value
    current_state ? symbol = symbols[:alive] : symbol = symbols[:dead]
  end

  def alive?
    @alive
  end

  private

  attr_reader :symbols
  attr_writer :symbol
end