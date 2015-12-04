require_relative 'tile'
require 'byebug'

class Board

  attr_accessor :grid, :mine_count, :revealed_count, :revealed_tiles

  def initialize(grid = Array.new(9) { Array.new(9)})
    @grid = grid
    populate_grid
    @mine_count = 0
    place_mines
    @revealed_count = 0
    @revealed_tiles = []
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
    puts "    1 2 3 4 5 6 7 8 9"
    grid.length.times do |row|
      d_row = ["#{row + 1} |"]
      grid.length.times do |col|
        pos = [row, col]
        d_row << self[pos].to_s
      end

      puts d_row.join(" ")
    end
  end

  def won?
    revealed_count == 81 - mine_count
  end

end
