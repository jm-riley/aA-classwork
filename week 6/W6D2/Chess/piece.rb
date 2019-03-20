class Piece
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def inspect
        @name
    end

end

class NullPiece < Piece
    def initialize(name)
        @name = "null "
    end

    def inspect
        @name
    end
end