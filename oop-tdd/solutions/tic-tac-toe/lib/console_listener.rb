class ConsoleListener < Struct.new(:kernel)
  def game_started(game)
    kernel.puts 'WELCOME TO OOP TIC-TAC-TOE!'
    kernel.puts game.to_s
    make_move(game)
  end

  def game_move_made(game)
    kernel.puts game.to_s
    make_move(game)
  end

  def game_won(game, player)
    kernel.puts game.to_s
    kernel.puts "GAME OVER! #{player} WON!"
  end

  def game_ended_with_draw(game)
    kernel.puts game.to_s
    kernel.puts 'GAME OVER! DRAW!'
  end

  def illegal_move_made(game)
    kernel.puts "SORRY THAT'S NOT POSSIBLE, TRY AGAIN!"
    make_move(game)
  end

  private
  def make_move(game)
    kernel.puts "MAKE YOUR MOVE"
    x, y = read_move
    game.move(x, y)
  end

  def read_move
    kernel.gets.split(' ').map(&:to_i)
  end
end
