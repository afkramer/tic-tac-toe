# board.rb

class Board
  attr_reader :board

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def update_board(num, symbol)
    @board.each_with_index do |row, row_index|
      row.each_with_index do |element, col_index|
        @board[row_index][col_index] = symbol if element == num
      end
    end
  end

  def check_spot_available(num)
    @board.any? do |row|
      row.any? { |element| element == num }
    end
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

  def winner?(symbol)
    winner_rows?(symbol) || winner_cols?(symbol) || winner_diagonal?(symbol)
  end

  def stalemate?
    @board.all? do |row|
      row.all? { |element| element == 'X' || element == 'O' }
    end
  end
end
