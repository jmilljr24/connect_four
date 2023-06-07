module Miscellaneous
  def yellow_circle
    "\e[33m\u25cf\e[0m"
  end

  def blue_circle
    "\e[34m\u25cf\e[0m"
  end

  def empty_circle
    "\u25cb"
  end
end

class Board
  include Miscellaneous
  attr_accessor :grid

  def initialize
    @grid = Array.new(6) { Array.new(7) { empty_circle } }
  end

  def display_board
    @grid.each do |row|
      puts row.join(' ')
    end
    puts (1..7).to_a.join(' ')
  end
end

board = Board.new

board.display_board

class User
  attr_reader :name, :symbol
  attr_accessor :selections

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @selections = []
  end
end

class Game
  include Miscellaneous
  attr_reader :board, :player1, :player2, :current_player

  def initialize
    @board = Board.new
    @player1 = User.new('Player One', 'Red')
    @player2 = User.new('Player Two', 'Black')
    @current_player = nil
  end

  def play
    # until game_over?
  end

  def game_over?
    return false if @board.grid[0].include?(empty_circle)

    true
  end
end

game = Game.new

game.game_over?
