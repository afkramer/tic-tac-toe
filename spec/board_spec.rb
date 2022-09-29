# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#update_board(num, symbol)' do
    context 'when chosen number is available' do
      # Alternate setup to take advantage of how board is initialized
      #board_setup = [['X', 2, 3], [4, 'O', 6], [7, 8, 'X']]
      #subject(:board) { described_class.new(board_setup) }

      before do
        board.instance_variable_set(:@board, [['X', 2, 3], [4, 'O', 6], [7, 8, 'X']]) 
      end

      it "updates board at the correct position with symbol 'X'" do
        board.update_board(8, 'X')
        expect(board.instance_variable_get(:@board)).to eql([['X', 2, 3], [4, 'O', 6], [7, 'X', 'X']])
      end

      it "updates board at the correct position with symbol 'O'" do
        board.update_board(2, 'O')
        expect(board.instance_variable_get(:@board)).to eql([['X', 'O', 3], [4, 'O', 6], [7, 8, 'X']])
      end

      it 'does not update the board if the position is not available' do
        board.update_board(1, 'O')
        expect(board.instance_variable_get(:@board)).to eql([['X', 2, 3], [4, 'O', 6], [7, 8, 'X']])
      end
    end
  end

  describe '#check_spot_available(num)' do
    before do
      board.instance_variable_set(:@board, [['O', 2, 'X'], [4, 'X', 6], [7, 8, 9]])
    end

    it "returns false when the spot has already been chosen by 'X'" do
      check_spot_result = board.check_spot_available(3)
      expect(check_spot_result).to be false
    end

    it "returns false when the spot has already been chosen by 'O'" do
      check_spot_result = board.check_spot_available(1)
      expect(check_spot_result).to be false
    end

    it 'returns true when the spot is still available' do
      check_spot_result = board.check_spot_available(8)
      expect(check_spot_result).to be true
    end
  end

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
        board.instance_variable_set(:@board, [%w[X O X], %w[O X X], %w[O X O]])
      end

      it 'returns true' do
        stalemate_result = board.stalemate?
        expect(stalemate_result).to be true
      end
    end

    context 'when all available spots are taken and there is a winner' do
      before do
        board.instance_variable_set(:@board, [%w[X X X], %w[X O O], %w[X O O]])
      end

      it 'returns false' do
        stalemate_result = board.stalemate?
        expect(stalemate_result).to be false
      end
    end

    context 'when there are still spots available' do
      before do
        board.instance_variable_set(:@board, [[1, 'X', 'O'], %w[X X O], %w[O O X]])
      end

      it 'returns false' do
        stalemate_result = board.stalemate?
        expect(stalemate_result).to be false
      end
    end
  end
end
