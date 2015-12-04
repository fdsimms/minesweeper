require_relative 'board'
require_relative 'tile'

class Game

  def initialize(board = Board.new)
    @board = board
  end

  def play

    until won?

    end

  end

  def play_turn

  end

  def guess
    input = gets.chomp.gsub(/\W/, "").split("") #["LETTER", "NUM", "NUM"]
    letter = input.first.upcase
    pos = [input[1].to_i - 1, input[2].to_i - 1]
    [letter, pos]
    #["LETTER", [1, 2]]
  end

  def won?
    board.won?
  end
end
