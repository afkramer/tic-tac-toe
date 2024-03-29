# game.rb

#require 'pry-byebug'
require_relative './board'
require_relative './player'
require_relative './gui'

class Game
  def initialize(board: Board.new, gui: Gui.new, player1: nil, player2: nil)
    @board = board
    @gui = gui
    @player1 = player1
    @player2 = player2
  end

  def run
    start_game
    play_game
  end

  def start_game
    @player1 = Player.new(@gui.get_player(1, 'X'), 'X')
    @player2 = Player.new(@gui.get_player(2, 'O'), 'O')
  end

  def play_game
    loop do
      current_player = determine_current_player
      @gui.show_board(@board.board)
      current_player.move(@gui, @board)
      result = game_result(current_player)
      unless result.nil?
        end_game(result, current_player)
        break
      end
      switch_current_player
    end
  end

  def determine_current_player
    @player1.has_turn ? @player1 : @player2
  end

  def switch_current_player
    @player1.switch_turn
    @player2.switch_turn
  end

  def game_result(current_player)
    if @board.winner?(current_player.symbol)
      'win'
    elsif @board.stalemate?
      'stalemate'
    end
  end

  def end_game(result, current_player)
    @gui.show_board(@board.board)
    if result == 'win'
      @gui.display_winner(current_player)
    else
      @gui.display_stalemate
    end
  end
end
