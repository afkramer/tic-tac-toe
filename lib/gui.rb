# gui.rb

class Gui
  def get_player(player_num, symbol)
    puts "Player #{player_num}: please enter your name. You will play as #{symbol}."
    gets.chomp
  end

  def show_board(board)
    puts '     0   1   2 '
    puts
    puts
  end
end