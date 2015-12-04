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
    @pos = pos
  end

  def reveal
    self.revealed = true
  end

  def neighbors
    dx, dy = pos
    neighbors = []

    ADJACENT_TILES.each do |adj_pos|
      x, y = adj_pos
      neigh_pos = [x + dx, y + dy]
      neighbors << board[neigh_pos]
    end

    neighbors
  end

  def neighbor_bomb_count
    count = 0

    neighbors.each do |neighbor|
      count += 1 if neighbor.bombed?
    end

    count
  end

  def bombed?
    @bombed
  end

  def inspect
    "#{bombed} #{flagged}"
  end



end
