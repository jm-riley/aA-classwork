class Pawn < Piece
    def symbol
        '  ♙  '.colorize(color)
    end

    def moves
        []
    end

    def move_dirs
        if color == :cyan
            ret_arr = [[1,0]]
            ret_arr << [2,0] if at_start_row?
            return ret_arr
        else
            ret_arr = [[-1,0]]
            ret_arr << [-2,0] if at_start_row?
            return ret_arr
        end
    end

    def at_start_row?
        true
    end

    # def forward_dir

    # end

    def forward_steps

    end

    def side_attacks

    end
end