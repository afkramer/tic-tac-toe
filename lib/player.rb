# player.rb

class Player
  attr_reader :name, :player_num, :symbol

  def initialize(name, player_num, symbol)
    @name = name
    @player_num = player_num
    @symbol = symbol
    @has_turn = @symbol == 'X' ? true : false
  end

  def get_move_row
    puts "Which row would you like to place your #{@symbol} in?"
    gets.chomp
  end
  
  def get_move_col
    puts "Which column would you like to place your #{symbol} in?"
    gets.chomp
  end

end