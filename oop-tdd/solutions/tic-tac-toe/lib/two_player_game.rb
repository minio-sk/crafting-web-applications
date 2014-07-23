class TwoPlayerGame
  def initialize(board, listener)
    @board = board
    @listener = listener
    @current_player = 'X'
  end

  def move(x, y)
    if @board.legal_move?(x, y)
      @board.move(x, y, @current_player)
      if @board.winning_move?(x, y, @current_player)
        @listener.game_won(self, @current_player)
      elsif @board.draw?
        @listener.game_ended_with_draw(self)
      else
        @current_player = @current_player == 'X' ? 'O' : 'X'
        @listener.game_move_made(self)
      end
    else
      @listener.illegal_move_made(self)
    end
  end

  def start
    @listener.game_started(self)
  end

  def to_s
    @board.to_s
  end
end
