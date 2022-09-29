# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'

describe Game do

  describe '#play_game' do
    # TODO
    # Test to make sure that loop ends when conditions are met
    # Test to make sure that messages are sent
  end

  describe '#determine_current_player' do
    let(:player1) { instance_double(Player) }
    let(:player2) { instance_double(Player) }
    subject(:game) { described_class.new(player1: player1, player2: player2) }

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
end
