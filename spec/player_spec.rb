# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/gui'
require_relative '../lib/board'

describe Player do
  let(:gui) { instance_double(Gui) }
  let(:board) { instance_double(Board) }
  subject(:player) { described_class.new('Norma', 'X') }

  # No test needed for #switch_turn as it only sends messages to self

  describe '#move' do
    context 'player chooses non-existent spot then available spot' do
      before do
        allow(gui).to receive(:get_move).and_return(11, 5)
        allow(board).to receive(:check_spot_available).with(5).and_return(true)
      end

      it "sends message to gui that spot doesn't exist then updates board" do
        aggregate_failures 'testing response' do
          expect(gui).to receive(:selection_not_allowed).once
          expect(board).to receive(:update_board).with(5, 'X').once
        end

        player.move(gui, board)
      end
    end

    context 'player chooses unavailable spot then available spot' do
      before do
        allow(gui).to receive(:get_move).and_return(7, 8)
        allow(board).to receive(:check_spot_available).and_return(false, true)
      end

      it 'sends message to gui that move not available then updates board' do
        aggregate_failures 'testing response' do
          expect(gui).to receive(:move_not_available).once
          expect(board).to receive(:update_board).with(8, 'X').once
        end
        player.move(gui, board)
      end
    end
  end
end
