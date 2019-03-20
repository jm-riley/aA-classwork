module Stepable

    def moves
        moves = []
        pos = @pos
        move_diffs.each do |dir|
            new_pos = [ pos[0] + dir[0], pos[1] + dir[1] ]
            if @board[new_pos].is_a?(NullPiece) && @board.valid_pos?(new_pos)
                moves << new_pos
            end
            moves
        end
    end

    def move_diffs
        
    end
end