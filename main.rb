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
        @winner = 'x'
      elsif p2 == 4
        @winner = 'x'
      end
    end
    @winner
  end

  def vertical_check
    # grid[2][0] = 'x'
    # grid[3][0] = 'x'
    # grid[4][0] = 'x'
    # grid[5][0] = 'x'

    r = 0
    c = 0
    count = 0

    7.times do
      current = @grid[r][c]
      6.times do
        current = @grid[r][c]
        if current == empty_circle
          r += 1
        elsif current == @grid[r + 1] [c]
          r += 1
          count += 1
          return @winner = current if count == 3
        else
          count = 0
          current = @grid[r][c]
          r += 1
        end
      end
      return unless @winner.nil?

      c += 1
      r = 0
    end
  end

  def diag_r(player, r, c, count = 0)
    return if count > 3

    return unless grid[r + 1][c + 1] == player

    count += 1
    return @winner = player if count == 3

    diag_r(player, r, c, count)
  end

  def game_over?
    return true unless @winner.nil?
    return true unless @grid[0].include?(empty_circle)

    false
  end
end

# board = Board.new

# board.diagonal_right

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
