class TicTacToeBoard
  def initialize
    @board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    @moves_count = 0
  end

  def move(x, y, player)
    @board[x - 1][y - 1] = player
    @moves_count += 1
  end

  def draw?
    @moves_count == 9
  end

  def winning_move?(x, y, player)
    winning_diagonal_at?(x, y, player) || winning_column_at?(x, player) || winning_row_at?(y, player)
  end

  def legal_move?(x, y)
    return false if x < 1 || x > 3 || y < 1 || y > 3
    @board[x - 1][y - 1].nil?
  end

  def to_s
    @board.each_with_object('') do |row, memo|
      row.map do |player|
        memo << (player.nil? ? '-' : player)
      end
      memo << "\n"
    end
  end

  private

  def winning_column_at?(x, player)
    @board[x - 1][0] == player && @board[x - 1][1] == player && @board[x - 1][2] == player
  end

  def winning_row_at?(y, player)
    @board[0][y - 1] == player && @board[1][y - 1] == player && @board[2][y - 1] == player
  end

  def winning_diagonal_at?(x, y, player)
    return true if x == y && @board[0][0] == player && @board[1][1] == player && @board[2][2] == player
    return true if x == 4 - y && @board[2][0] == player && @board[1][1] == player && @board[0][2] == player
    false
  end
end
