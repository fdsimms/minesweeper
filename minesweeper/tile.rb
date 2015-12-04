require_relative 'board'

class Tile

  ADJACENT_TILES = [
    [-1, -1],
    [-1,  0],
    [-1,  1],
    [ 0, -1],
    [ 0,  1],
    [ 1, -1],
    [ 1,  0],
    [ 1,  1]
  ]

  attr_accessor :bombed, :revealed, :flagged, :board, :pos

  def initialize(board, pos, bombed = false)
    @board = board
    @bombed = bombed
    @revealed = false
    @flagged = false
  end

  def reveal
    self.revealed = true
  end

  def neighbors(pos)
    @pos = pos
    dx, dy = pos

    neighbors = ADJACENT_TILES.map do |tile_array|
      x, y = tile_array
      [x + dx, y + dy]
    end
  end

  def neighbor_bomb_count
  end

  def inspect
    "#{bombed} #{flagged}"
  end



end
