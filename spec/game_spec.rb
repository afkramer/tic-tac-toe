# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
  subject(:game) { described_class.new }
  let(:player_one) { instance_double(Player) }
  let(:player_two) { instance_double(Player) }

  describe '#play_game' do
    # TODO
    # Test to make sure that loop ends when conditions are met
    # Test to make sure that messages are sent
  end

  describe '#determine_current_player' do
    # When players are initialized, player 1 is the first player -> no need to set up any instance variables before testing
  end
end
