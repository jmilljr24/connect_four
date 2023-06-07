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

  def horizontal_check
    @grid.each do |arr|
      break unless winner.nil?

      c = 0 # column of array
      p1 = 0
      p2 = 0
      until p1 == 4 || p2 == 4 || c == 8
        case arr[c]
        when 'x'
          p1 += 1
        when 'y'
          p2 += 1
        end
        c += 1
      end
      if p1 == 4
        @winner = 'Player One'
      elsif p2 == 4
        @winner = 'Player Two'
      end
    end
    return true unless @winner.nil?

    false
  end

  def game_over?
    return true unless @winner.nil?
    return true unless @grid[0].include?(empty_circle)

    false
  end
end

board = Board.new

board.horizontal_check

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
