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
        expect(horizontal_check.horizontal_check).to eq true
      end

      it 'returns false if there is not four pieces in a row in any row' do
        grid[0][3] = 'y'
        expect(horizontal_check.horizontal_check).to eq false
      end
    end
  end
end
