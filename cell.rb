class Cell
  def initialize
    @symbol = {alive: "@", dead: " "}
    @state = {current: false, new: false}
  end
end