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
  attr_reader :winner

  def initialize
    @grid = Array.new(6) { Array.new(7) { empty_circle } }
  end

  def display_board
    @grid.each do |row|
      puts row.join(' ')
    end
    puts (1..7).to_a.join(' ')
  end

  def horizontal_check(row, col, symbol)
    @grid[row][col] == symbol && @grid[row][col + 1] == symbol && @grid[row][col + 2] == symbol && @grid[row][col + 3] == symbol
  end

  def vertical_check(row, col, symbol)
    @grid[row][col] == symbol && @grid[row + 1][col] == symbol && @grid[row + 2][col] == symbol && @grid[row + 3][col] == symbol
  end

  def diagonal_right(row, col, symbol)
    @grid[row][col] == symbol && @grid[row + 1][col + 1] == symbol && @grid[row + 2][col + 2] == symbol && @grid[row + 3][col + 3] == symbol
  end

  def diagonal_left(row, col, symbol)
    @grid[row][col] == symbol && @grid[row + 1][col - 1] == symbol && @grid[row + 2][col - 2] == symbol && @grid[row + 3][col - 3] == symbol
  end

  def connect_four(row, col, symbol)
    horizontal_check(row, col,
                     symbol) || vertical_check(row, col,
                                               symbol) || diagonal_right(row, col,
                                                                         symbol) || diagonal_left(row, col, symbol)
  end

  def game_over?
    return true unless @winner.nil?
    return true unless @grid[0].include?(empty_circle)

    false
  end
end

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
end

# game = Game.new

# game.win_vertical?
board = Board.new

p board.check_four
