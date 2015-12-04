require_relative 'board'

class Tile

  attr_accessor :bombed, :revealed, :flagged, :board

  def initialize(board, bombed = false)
    @board = board
    @bombed = bombed
    @revealed = false
    @flagged = false
  end

  def reveal
    self.revealed = true
  end

  def neighbors(board)
    @board = board
  end

  def neighbor_bomb_count
  end

  def inspect
    "#{bombed} #{flagged}"
  end

end
