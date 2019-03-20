require_relative 'piece'

class Board
    attr_reader :rows
    def self.create_board
        new_board = Array.new(8) {Array.new(8)}
        (0..7).each do |row|
            (0..7).each do |col|
                if row < 2 || row > 5
                    new_board[row][col] = Piece.new('piece')
                else
                    new_board[row][col] = NullPiece.new("null")
                end

            end
        end
        new_board
    end

    def initialize
        @rows = Board.create_board
        
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos].is_a?(NullPiece) || !valid_pos?(start_pos)
            raise "No piece at this position"
        end
        end_row, end_col = end_pos
        if (end_row < 0 || end_row > 7) || (end_col < 0 || end_col > 7)
            raise "Not a valid end position"
        end
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.new("null")
        
    end
    
    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @rows[row][col] = piece
    end

    def valid_pos?(pos)
        end_row, end_col = pos
        if (end_row < 0 || end_row > 7) || (end_col < 0 || end_col > 7)
            return false
        end
        true
    end

end



# [[],[],[],[],[],[],[],[]] 0
# [[],[],[],[],[],[],[],[]] 1
# [[],[],[],[],[],[],[],[]] 2
# [[],[],[],[],[],[],[],[]] 3
# [[],[],[],[],[],[],[],[]] 4
# [[],[],[],[],[],[],[],[]] 5
# [[],[],[],[],[],[],[],[]] 6
# [[],[],[],[],[],[],[],[]] 7

# board = Board.new
# p board.board