require_relative 'lib/two_player_game'
require_relative 'lib/tic_tac_toe_board'
require_relative 'lib/console_listener'

listener = ConsoleListener.new(Kernel)
game = TwoPlayerGame.new(TicTacToeBoard.new, listener)

game.start


# # Rails usage
# class RailsTicTacToeListener
#   attr_accessor :listener
#
#   delegate :game_started, :game_ended_with_draw, :game_move_made, :game_won, :illegal_move_made, to: :listener
# end
#
# class TicTacToeController
#   @@listener = RailsTicTacToeListener.new
#
#   before_action :set_listener
#
#   def set_listener
#     @@listener.listener = self
#   end
#
#   def new
#     @@game = TwoPlayerGame.new(TicTacToeBoard.new, @@listener)
#     @@game.start
#   end
#
#   def move
#     @@game.move(params[:x].to_i, params[:y].to_i)
#   end
#
#
#   def game_started(game)
#     # render
#   end
#
#   def game_ended_with_draw(game)
#    # render draw game
#   end

#   def illegal_move_made(game)
#   end
# end