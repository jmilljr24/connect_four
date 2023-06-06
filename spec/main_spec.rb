require './main'

describe Game do
  context 'when checking if the game is over' do
    describe '#game_over?' do
      subject(:game) { described_class.new }
      it 'returns false if the board is not full of selections' do
        expect(game.game_over?).not_to eq true
      end

      it 'returns true if the board is full' do
        game.board.instance_variable_set(:@cells, %w[x o])
        expect(game.game_over?).to eq true
      end
    end
  end
end
