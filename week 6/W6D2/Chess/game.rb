require_relative 'board'
require_relative 'cursor'
require_relative 'display'
class Game

    def initialize
       @board = Board.new
       @display = Display.new(@board)
       @player1 = HumanPlayer.new
       @player2 = HumanPlayer.new
       @current_player = @player1
    end

    def play

    end

    private
    def notify_players

    end

    def swap_turn

    end

end

class HumanPlayer

    def make_move

    end

end