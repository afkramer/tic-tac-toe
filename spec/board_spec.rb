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

      it "results in false when called with a symbol other than 'X' or 'O'" do
        winner_result = board.winner?('A')
        expect(winner_result).to be false
      end
    end

    context 'when winner uses symbol O and has a winning row' do
      before do
        board.instance_variable_set(:@board, [%w[O O O], ['X', 5, 'X'], [7, 8, 9]])
      end

      it "results in true when called with symbol 'O'" do
        winner_result = board.winner?('O')
        expect(winner_result).to be true
      end

      it "results in false when called with symbol 'X'" do
        winner_result = board.winner?('X')
        expect(winner_result).to be false
      end

      it "results in false when called with a symbol other than 'X' or 'O'" do
        winner_result = board.winner?(7)
        expect(winner_result).to be false
      end
    end

    context 'when winner uses symbol X and has a winning column' do
      before do
        board.instance_variable_set(:@board, [[1, 'X', 'O'], ['O', 'X', 6], [7, 'X', 9]])
      end

      it "returns true when called with symbol 'X'" do
        winner_result = board.winner?('X')
        expect(winner_result).to be true
      end

      it "returns false when called with symbol 'O'" do
        winner_result = board.winner?('O')
        expect(winner_result).to be false
      end

      it "returns false when called with symbol other than 'X' or 'O'" do
        winner_result = board.winner?('G')
        expect(winner_result).to be false
      end
    end

    context "when winner uses symbol 'O' and has a winning column" do
      before do
        board.instance_variable_set(:@board, [[1, 'X', 'O'], ['X', 5, 'O'], ['X', 8, 'O']])
      end

      it "returns true when called with symbol 'O'" do
        winner_result = board.winner?('O')
        expect(winner_result).to be true
      end

      it "returns false when called with symbol 'X'" do
        winner_result = board.winner?('X')
        expect(winner_result).to be false
      end

      it "returns false when called with symbol other than 'X' or 'O'" do
        winner_result = board.winner?(2)
        expect(winner_result).to be false
      end
    end

    context "when winner user symbol 'X' and has a winning diagonal" do
      before do
        board.instance_variable_set(:@board, [['X', 'O', 3], ['O', 'X', 6], [7, 8, 'X']])
      end

      it "returns true when called with symbol 'X'" do
        winner_result = board.winner?('X')
        expect(winner_result).to be true
      end

      it "returns false when called with symbol 'O'" do
        winner_result = board.winner?('O')
        expect(winner_result).to be false
      end

      it "returns false when called with a symbol other than 'X' or 'O'" do
        winner_result = board.winner?(5)
        expect(winner_result).to be false
      end
    end

    context "when winner uses symbol 'O' and has a winning diagonal" do
      before do
        board.instance_variable_set(:@board, [['X', 2, 'O'], ['X', 'O', 6], %w[O X X]])
      end

      it "returns true when called with symbol 'O'" do
        winner_result = board.winner?('O')
        expect(winner_result).to be true
      end

      it "returns false when called with symbol 'X'" do
        winner_result = board.winner?('X')
        expect(winner_result).to be false
      end

      it "returns false when called with a symbol other than 'X' or 'O'" do
        winner_result = board.winner?('hello')
        expect(winner_result).to be false
      end
    end
  end

  describe '#stalemate?' do

    context 'when all available spots are taken and there is no winner' do
      before do
        board.instance_variable_set(:@board, [%w[X X X], %w[O X X], %w[O O O]])
      end

      it 'returns true' do
        stalemate_result = board.stalemate?
        expect(stalemate_result).to be true
      end
    end
  end
end
