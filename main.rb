class Board
  attr_accessor :cells

  def initialize
    @cells = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    # @cells = %w[x o]
  end

  def display_board
    puts <<-HEREDOC

          #{cells[0]} | #{cells[1]} | #{cells[2]} | #{cells[3]}
         ----+----+----
          #{cells[4]} | #{cells[5]} | #{cells[6]} | #{cells[7]}
         ----+----+----
          #{cells[8]} | #{cells[9]} | #{cells[10]} | #{cells[11]}
          ----+----+----
          #{cells[12]} | #{cells[13]} | #{cells[14]} | #{cells[15]}

    HEREDOC
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
    return true if @board.cells.all? { |i| i.is_a?(String) }

    false
  end
end

game = Game.new

p game.game_over?
