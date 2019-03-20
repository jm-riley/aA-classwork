require 'singleton'


class Piece
    attr_reader :board, :color, :pos, :name
    def initialize(color,board,pos)
        @color = color
        @board = board
        @pos = pos
        
    end

    def initialize(name)
        @name = name
    end

    def to_s

    end

    def empty?

    end

    def valid_moves

    end

    def pos=(pos)
        @pos = pos
    end

    def symbol

    end

    def move_into_check?(end_pos)

    end

end



class NullPiece < Piece
    include Singleton
    def initialize()
        @name = "     "
    end

    def inspect
        @name
    end
end
