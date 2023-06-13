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

  def column_full?(column)
    @grid[0][column] != empty_circle
  end

  # column is selected by user
  def row_set(column, symbol)
    row = 5

    row -= 1 while @grid[row][column] != empty_circle
    @grid[row][column] = symbol
  end

  def horizontal_check(row, col, symbol)
    return if col > 3

    @grid[row][col] == symbol && @grid[row][col + 1] == symbol && @grid[row][col + 2] == symbol && @grid[row][col + 3] == symbol
  end

  def vertical_check(row, col, symbol)
    return if row > 2

    @grid[row][col] == symbol && @grid[row + 1][col] == symbol && @grid[row + 2][col] == symbol && @grid[row + 3][col] == symbol
  end

  def diagonal_right(row, col, symbol)
    return unless row < 3
    return if col > 3

    @grid[row][col] == symbol && @grid[row + 1][col + 1] == symbol && @grid[row + 2][col + 2] == symbol && @grid[row + 3][col + 3] == symbol
  end

  def diagonal_left(row, col, symbol)
    return unless row < 3
    return if col < 3

    @grid[row][col] == symbol && @grid[row + 1][col - 1] == symbol && @grid[row + 2][col - 2] == symbol && @grid[row + 3][col - 3] == symbol
  end

  def connect_four(row, col, symbol)
    horizontal_check(row, col,
                     symbol) || vertical_check(row, col,
                                               symbol) || diagonal_right(row, col,
                                                                         symbol) || diagonal_left(row, col, symbol)
  end

  def board_full?
    !@grid[0].include?(empty_circle)
  end
end

class User
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

class Game
  include Miscellaneous
  attr_reader :board, :player1, :player2, :current_player

  def initialize
    @board = Board.new
    @player1 = User.new('Player One', yellow_circle)
    @player2 = User.new('Player Two', blue_circle)
  end

  def verify_input(column)
    column.between?(0, 6) && !@board.column_full?(column)
  end

  def user_input(current_player)
    loop do
      puts "#{current_player.name}'s turn"
      column = gets.chomp.to_i - 1
      return column if verify_input(column)

      puts 'Invalid input'
    end
  end

  def play
    @board.display_board
    current_player = @player1
    loop do
      @board.row_set(user_input(current_player), current_player.symbol)
      @board.display_board
      break if game_over?(current_player) || draw?

      current_player = current_player == @player1 ? @player2 : @player1
    end
  end

  def game_over?(current_player)
    6.times do |row|
      7.times do |column|
        if @board.connect_four(row, column, current_player.symbol)
          puts "#{current_player.name} is the winner!"
          return true
        end
      end
    end
    false
  end

  def draw?
    return unless @board.board_full?

    puts "It's a draw!"
    true
  end
end

game = Game.new
game.play
