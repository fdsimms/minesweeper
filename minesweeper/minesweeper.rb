require_relative 'board'
require_relative 'tile'

class Game

  attr_accessor :board, :lost

  def initialize(board = Board.new)
    @board = board
    @lost = false
  end

  def play

    until over?
      display
      play_turn
    end

    puts won? ? "You've won!" : "Shit! You lost!"

  end

  def display
    board.display
  end

  def play_turn
    prompt
    input = guess
    letter = input.first
    pos = input[1]
    tile = board[pos]
    if letter == "R"
      tile.reveal
      reveal_neighbors(tile)

      if tile.bombed?
        self.lost = true
      end

    elsif letter == "F"
      tile.flag
    else
      raise "Invalid move, please guess again."
    end
  end

  def reveal_neighbors(tile)
    neighbors_queue = [tile]


    until neighbors_queue.empty?
      current_tile = neighbors_queue.shift
      neighbors = current_tile.neighbors

      neighbors.each do |neighbor|
        if !neighbor.bombed? && !neighbor.flagged?
          neighbor.reveal
          neighbors_queue += neighbor.neighbors
        end
      end

    end

  end

  def guess
    input = gets.chomp.gsub(/\W/, "").split("") #["LETTER", "NUM", "NUM"]
    letter = input.first.upcase
    pos = [input[1].to_i - 1, input[2].to_i - 1]
    [letter, pos]
    #["LETTER", [1, 2]]
  end

  def prompt
    puts "Enter in your guess. To select a tile, type R and the position (R, 2, 1).
    To flag a tile, type F and the position (F, 1, 8)."
  end

  def over?
    won? || lost?
  end

  def won?
    board.won?
  end
end
