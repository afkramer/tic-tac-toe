# game.rb

require './board'
require './player'
require './gui'

class Game
  def initialize
    @board = Board.new
    @gui = Gui.new
    @player1 = nil
    @player2 = nil
  end

  def run
    start_game
    # Check if there are any reasons not to use loop do
    loop do
      # Determine which player has their turn
      # Have them pick where to place their symbol
      # Make sure that place is still free
      # Update the board
      # Show the board
      # Check if they won, if so, break
    end
    # Display winner, end game
  end

  def start_game
    @player1 = Player.new(@gui.get_player(1, 'X'), 1, 'X')
    @player2 = Player.new(@gui.get_player(2, 'O'), 2, 'O')
  end

  def check_for_winner(symbol)
    @board.board.winner_rows?(symbol) || @board.board.winner_cols?(symbol) || 
      @board.board.winner_diagonal?(symbol)
  end
end


def main
  game = Game.new()
  game.run
end

main()