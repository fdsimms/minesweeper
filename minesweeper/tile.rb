require_relative 'board'
require 'byebug'

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
    if self.neighbor_bomb_count == 0

      self.neighbors.each do |neighbor|
        neighbor.reveal unless neighbor.revealed?
      end
    end


  end

  def neighbors
    dx, dy = pos
    neighbors = []

    ADJACENT_TILES.each do |adj_pos|
      x, y = adj_pos
      neigh_pos = [x + dx, y + dy]
      neighbors << board[neigh_pos] if in_bounds?(neigh_pos)
    end

    neighbors
  end

  def in_bounds?(pos)
    x, y = pos
    x.between?(0,8) && y.between?(0,8)
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
    pos
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
    elsif  bombed?
      "B"
    else
      "*"
    end
  end



  def remove_revealed_neighbors(neighbors)
    neighbors.select do |neighbor|
      bomb_count = neighbor.neighbor_bomb_count
      !board.revealed_tiles.include?(neighbor) && bomb_count == 0
    end
  end



end
