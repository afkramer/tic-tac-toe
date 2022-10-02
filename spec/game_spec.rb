# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
  let(:player1) { instance_double(Player) }
  let(:player2) { instance_double(Player) }
  let(:board) { instance_double(Board) }
  subject(:game) { described_class.new(board: board, player1: player1, player2: player2) }

  describe '#play_game' do
    # TODO
    # Test to make sure that loop ends when conditions are met
    # Test to make sure that messages are sent
  end

  describe '#determine_current_player' do
    context 'if player1 is up' do
      before do
        allow(player1).to receive(:has_turn).and_return(true)
      end

      it 'returns player1' do
        current_player = game.determine_current_player
        expect(current_player).to eq(game.instance_variable_get(:@player1))
      end
    end

    context 'if player2 is up' do
      before do
        allow(player1).to receive(:has_turn).and_return(false)
      end

      it 'returns player2' do
        current_player = game.determine_current_player
        expect(current_player).to eq(game.instance_variable_get(:@player2))
      end
    end
  end

  describe '#switch_current_player' do
    it 'sends messages to both player instances' do
      expect(player1).to receive(:switch_turn)
      expect(player2).to receive(:switch_turn)
      game.switch_current_player
    end
  end

  describe '#game_result' do
    context 'player1 is the winner' do
      before do
        allow(player1).to receive(:symbol).and_return('X')
        allow(board).to receive(:winner?).and_return(true)
      end

      it "returns 'win'" do
        result = game.game_result(player1)
        expect(result).to eq('win')
      end
    end
  end
end
