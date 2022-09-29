# player.rb

class Player
  attr_reader :name, :player_num, :symbol, :has_turn
  attr_writer :has_turn

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @has_turn = @symbol == 'X'
  end

  def switch_turn
    @has_turn = !@has_turn
  end

  def move(gui, board)
    loop do
      grid_selection = gui.get_move(@name, @symbol)
      if grid_selection < 1 || grid_selection > 9
        gui.selection_not_allowed
      elsif board.check_spot_available(grid_selection) == true
        board.update_board(grid_selection, @symbol)
        break
      else
        gui.move_not_available
      end
    end
  end
end
