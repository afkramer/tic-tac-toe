# gui.rb

class Gui
  def get_player(player_num, symbol)
    puts
    puts "Player #{player_num}: please enter your name. You will play as #{symbol}."
    gets.chomp
  end

  def get_move(player_name, symbol)
    puts
    puts "#{player_name}: Where would you like to place your #{symbol}?"
    puts
    gets.chomp.to_i
  end

  def move_not_available
    puts
    puts 'That spot is already taken. Please choose another spot.'
  end

  def selection_not_allowed
    puts
    puts 'That is not a valid entry. Please choose a value between 1 and 9.'
  end

  def show_board(board)
    puts
    puts "  #{board[0][0]} | #{board[0][1]} | #{board[0][2]} "
    puts '  -----------'
    puts "  #{board[1][0]} | #{board[1][1]} | #{board[1][2]} "
    puts '  -----------'
    puts "  #{board[2][0]} | #{board[2][1]} | #{board[2][2]} "
    puts
  end

  def display_winner(winner)
    puts
    puts "Congratulations #{winner.name}! You win!"
    puts
  end

  def display_stalemate
    puts
    puts 'Looks like we have a stalemate! Thanks for playing.'
    puts
  end
end
