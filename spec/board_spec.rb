# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#winner?(symbol)' do

    context 'when winner uses symbol X and has a winning row' do
      before do
        board.instance_variable_set(:@board, [[1, 'O', 3], %w[X X X], [7, 'O', 9]])
      end

      it "results in true when called with symbol 'X'" do
        winner_result = board.winner?('X')
        expect(winner_result).to be true
      end

      it "results in false when called with symbol 'O'" do
        winner_result = board.winner?('O')
        expect(winner_result).to be false
      end
    end
  end
end
