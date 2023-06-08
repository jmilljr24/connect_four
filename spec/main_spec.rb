require './main'

describe Board do
  context 'when checking if the game is over' do
    describe '#game_over?' do
      subject(:board) { described_class.new }
      it 'returns false if the board is not full of selections' do
        expect(board.game_over?).not_to eq true
      end

      it 'returns true if the board is full' do
        board.instance_variable_set(:@grid, Array.new(6) { Array.new(7) { 'x' } })
        expect(board.game_over?).to eq true
      end

      it 'returns true if there is a winner' do
        board.instance_variable_set(:@winner, 'x')
        expect(board.game_over?).to eq true
      end
    end

    describe '#horizontal_check' do
      subject(:horizontal_check) { described_class.new }
      let(:grid) { horizontal_check.instance_variable_get(:@grid) }

      before do
        grid[0][1] = 'x'
        grid[0][2] = 'x'
        grid[0][3] = 'x'
        grid[0][4] = 'x'
      end
      it 'returns true if a row has four pieces in a row' do
        expect(horizontal_check.horizontal_check).to eq('x')
      end

      it 'returns false if there is not four pieces in a row in any row' do
        grid[0][3] = 'y'
        expect(horizontal_check.horizontal_check).to be_nil
      end
    end
    describe '#vertical_check' do
      subject(:vertical_check) { described_class.new }
      let(:grid) { vertical_check.instance_variable_get(:@grid) }

      it 'returns the winner if four in the first column' do
        grid[0][0] = 'x'
        grid[1][0] = 'x'
        grid[2][0] = 'x'
        grid[3][0] = 'x'
        expect(vertical_check.vertical_check).to eq('x')
      end

      it 'returns the winner if four in the second column' do
        grid[0][1] = 'x'
        grid[1][1] = 'x'
        grid[2][1] = 'x'
        grid[3][1] = 'x'
        expect(vertical_check.vertical_check).to eq('x')
      end

      it 'returns the winner if four in the first column with last row' do
        grid[2][0] = 'x'
        grid[3][0] = 'x'
        grid[4][0] = 'x'
        grid[5][0] = 'x'
        expect(vertical_check.vertical_check).to eq('x')
      end
      it 'returns the winner if four in the last column with last row' do
        grid[2][0] = 'x'
        grid[3][0] = 'x'
        grid[4][0] = 'x'
        grid[5][0] = 'x'
        expect(vertical_check.vertical_check).to eq('x')
      end
    end

    describe '#diagonal_right' do
      subject(:diag_right) { described_class.new }
      let(:grid) { diag_right.instance_variable_get(:@grid) }

      xit 'returns the winner if four in a row diagonal down right' do
        grid[0][0] = 'x'
        grid[1][1] = 'x'
        grid[2][2] = 'x'
        grid[3][3] = 'x'
        expect(diag_right.diagonal_right).to eq('x')
      end

      xit 'returns the winner if four in a row diagonal down right in middle of board' do
        grid[2][2] = 'x'
        grid[3][3] = 'x'
        grid[4][4] = 'x'
        grid[5][5] = 'x'
        expect(diag_right.diagonal_right).to eq('x')
      end
    end

    describe 'diag_r' do
      subject(:diag_r) { described_class.new }
      let(:count) { diag_r.instance_variable_get(:count) }
      let(:grid) { diag_r.instance_variable_get(:@grid) }

      it 'returns if count is greater than 3' do
        player = 'x'
        r = 0
        c = 0
        count = 4
        expect(diag_r.diag_r(player, r, c, count)).to be_nil
      end
      it 'returns winner if four in a row' do
        grid[2][2] = 'x'
        grid[3][3] = 'x'
        grid[4][4] = 'x'
        grid[5][5] = 'x'
        player = 'x'
        r = 1
        c = 1
        expect(diag_r.diag_r(player, r, c)).to eq('x')
      end
    end
  end
end
