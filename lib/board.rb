require_relative 'misc'

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
