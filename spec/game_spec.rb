# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  let(:player1) { instance_double(Player) }
  let(:player2) { instance_double(Player) }
  let(:board) { instance_double(Board) }
  let(:gui) { instance_double(Gui) }
  subject(:game) { described_class.new(board: board, gui: gui, player1: player1, player2: player2) }

  describe '#play_game' do
    # TODO
    # Test to make sure that loop ends when conditions are met
    # Test to make sure that messages are sent
    context 'if there is one move and then a win' do
      before do
        allow(game).to receive(:determine_current_player).and_return(player1)
        allow(gui).to receive(:show_board)
        allow(board).to receive(:board)
        allow(player1).to receive(:move)

        result1 = nil
        result2 = 'win'
        allow(game).to receive(:game_result).with(player1).and_return(result1, result2)
      end

      it 'loops once then ends game' do

        aggregate_failures 'testing_response' do
          expect(game).to receive(:switch_current_player).once
          expect(game).to receive(:end_game).once
        end

        game.play_game
      end
    end
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

    context 'there is a stalemate' do
      before do
        allow(player2).to receive(:symbol).and_return('O')
        allow(board).to receive(:winner?).and_return(false)
        allow(board).to receive(:stalemate?).and_return(true)
      end

      it "returns 'stalemate'" do
        result = game.game_result(player2)
        expect(result).to eq('stalemate')
      end
    end
  end

  describe '#end_game' do
    before do
      allow(board).to receive(:board).and_return(board.instance_variable_get(:@board))
    end

    context 'player2 is the winner' do
      it 'displays the winner' do
        expect(gui).to receive(:show_board)
        expect(gui).to receive(:display_winner).with(player2)
        game.end_game('win', player2)
      end
    end

    context 'there is a stalemate' do
      it 'displays a stalemate' do
        expect(gui).to receive(:show_board)
        expect(gui).to receive(:display_stalemate)
        game.end_game('stalemate', player2)
      end
    end
  end
end
