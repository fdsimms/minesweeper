require_relative 'tile'

class Board



  attr_accessor :grid, :mine_count

  def initialize(grid = Array.new(9) { Array.new(9)})
    @grid = grid
    populate_grid
    @mine_count = 0
    place_mines
  end

  def populate_grid
    grid.length.times do |x|
      grid.length.times do |y|
        pos = [x, y]
        self[pos] = Tile.new(self, pos)
      end
    end
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end

  def place_mines
    until mine_count == 10
      x, y = rand(0..8), rand(0..8)
      pos = [x, y]
      self[pos].bombed = true
      self.mine_count += 1
    end
  end

  def display
    grid.length.times do |row|

      grid.length.times do |y|
        pos = [x, y]

      end
    end
  end

end
