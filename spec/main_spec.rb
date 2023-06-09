require './main'

describe Board do
  context 'when checking if there is four in a row' do
    describe '#horizontal_check' do
      subject(:horizontal_check) { described_class.new }
      let(:grid) { horizontal_check.instance_variable_get(:@grid) }

      before do
        grid[0][0] = 'x'
        grid[0][1] = 'x'
        grid[0][2] = 'x'
        grid[0][3] = 'x'
      end
      it 'returns true if a row has four pieces in a row' do
        row = 0
        col = 0
        symbol = 'x'
        expect(horizontal_check.horizontal_check(row, col, symbol)).to be true
      end

      it 'returns nil if there is not four pieces in a row in any row' do
        row = 0
        col = 0
        symbol = 'x'
        grid[0][3] = 'y'
        expect(horizontal_check.horizontal_check(row, col, symbol)).to be false
      end
    end
    describe '#vertical_check' do
      subject(:vertical_check) { described_class.new }
      let(:grid) { vertical_check.instance_variable_get(:@grid) }

      before do
        grid[0][0] = 'x'
        grid[1][0] = 'x'
        grid[2][0] = 'x'
        grid[3][0] = 'x'
      end
      it 'returns the winner if four in the first column' do
        row = 0
        col = 0
        symbol = 'x'
        expect(vertical_check.vertical_check(row, col, symbol)).to be true
      end

      it 'returns the winner if four in the last column with last row' do
        grid[2][6] = 'x'
        grid[3][6] = 'x'
        grid[4][6] = 'x'
        grid[5][6] = 'x'
        row = 2
        col = 6
        symbol = 'x'
        expect(vertical_check.vertical_check(row, col, symbol)).to be true
      end

      it 'returns false if there is not four in a row' do
        grid[2][0] = 'y'
        row = 0
        col = 0
        symbol = 'x'
        expect(vertical_check.vertical_check(row, col, symbol)).to be false
      end
    end

    describe '#diagonal_right' do
      subject(:diag) { described_class.new }
      let(:grid) { diag.instance_variable_get(:@grid) }

      it 'returns the winner if four in a row diagonal down right' do
        grid[0][0] = 'x'
        grid[1][1] = 'x'
        grid[2][2] = 'x'
        grid[3][3] = 'x'
        row = 0
        col = 0
        symbol = 'x'
        expect(diag.diagonal_right(row, col, symbol)).to be true
      end

      it 'returns the winner if four in a row diagonal down right in middle of board' do
        grid[2][2] = 'x'
        grid[3][3] = 'x'
        grid[4][4] = 'x'
        grid[5][5] = 'x'
        row = 2
        col = 2
        symbol = 'x'
        expect(diag.diagonal_right(row, col, symbol)).to be true
      end

      it 'returns the false if there is not four in a row' do
        grid[2][2] = 'x'
        grid[3][3] = 'x'
        grid[4][4] = 'y'
        grid[5][5] = 'x'
        row = 2
        col = 2
        symbol = 'x'
        expect(diag.diagonal_right(row, col, symbol)).to be false
      end
    end
    describe '#diagonal_left' do
      subject(:diag) { described_class.new }
      let(:grid) { diag.instance_variable_get(:@grid) }

      before do
        grid[0][4] = 'x'
        grid[1][3] = 'x'
        grid[2][2] = 'x'
        grid[3][1] = 'x'
      end
      it ' returns the true if your in a row diagonal right' do
        row = 0
        col = 4
        symbol = 'x'
        expect(diag.diagonal_left(row, col, symbol)).to be true
      end

      it ' returns the true if your in a row diagonal right' do
        grid[2][2] = 'y'
        row = 0
        col = 4
        symbol = 'x'
        expect(diag.diagonal_left(row, col, symbol)).to be false
      end
    end
  end
  context 'When checking if the board is full' do
    describe '#board_full?' do
      subject(:board) { described_class.new }

      it 'returns false if the board is not full' do
        expect(board.board_full?).to be false
      end
    end
  end
end

describe Game do
  context 'When checking if the game is over' do
    describe '#game_over?' do
      subject(:game) { described_class.new }
      let(:board) { instance_variable_get(:@board) }
      let(:player) { instance_double(User, player1: 'Player One', symbol: 'x') }
      xit 'returns false if the board is not full of selections' do
        expect(game.game_over?).not_to eq true
      end
    end
  end
end
