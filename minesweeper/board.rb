class Board

  attr_accessor :grid

  def initialize(grid = Array.new(9) {Array.new(9)})
    @grid = grid
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end

end
