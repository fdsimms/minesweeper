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

  def flag
    self.flagged = true
  end

  def reveal
    self.revealed = true
    board.revealed_count += 1
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
    bombed
  end

  def flagged?
    flagged
  end

  def revealed?
    revealed
  end

  def inspect
    to_s
  end

  def to_s
    if revealed? && !bombed?
      if neighbor_bomb_count == 0
        "_"
      else
        "#{neighbor_bomb_count}"
      end
    elsif flagged?
      "F"
    elsif revealed? && bombed?
      "B"
    else
      "*"
    end
  end



end
