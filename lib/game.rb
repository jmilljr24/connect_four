require_relative 'board'
require_relative 'user'
require_relative 'misc'

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
