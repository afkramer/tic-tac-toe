# board.rb

class Board
  attr_reader :board

  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def update_board(row, col, symbol)
    @board[row][col] = symbol
  end

  def winner_rows?(symbol)
    @board.any? do |row|
      row.all? { |cell| cell == symbol }
    end
  end

  def winner_cols?(symbol)
    col_results = [0, 0, 0]
    @board.each do |row|
      row.each_with_index { |col, col_index| col_results[col_index] += 1 if col == symbol }
    end
    col_results.any? { |element| element == 3 }
  end

  def winner_diagonal?(symbol)
    (@board[0][0] == symbol && @board[1][1] == symbol && @board[2][2] == symbol) || 
    (@board[0][2] == symbol && @board[1][1] == symbol && @board[2][0] == symbol)
  end
end