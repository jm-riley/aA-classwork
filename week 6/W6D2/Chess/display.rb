require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
    attr_reader :cursor, :board
    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], @board)
        
    end

    def render
        color = :red
        
        (0..7).each do |row|
            inner = []
            (0..7).each do |col|
                if cursor.cursor_pos == [row, col]
                    inner << board[[row, col]].name.colorize(background: :blue)
                else board[[row, col]] != nil 
                    inner << board[[row, col]].name.colorize(background: color)
                end
                color = color == :red ? :green : :red
            end
            puts inner.join(' ')
            color = color == :red ? :green : :red
        end
    end

    def play
        loop do
            system("clear")
            render
            @cursor.get_input
        end
    end
end

# self.board.rows.each { |row| p row }

# def render
#     system("clear")
#     puts "  #{(0...size).to_a.join(' ')}"
#     rows.each_with_index do |row, i|
#       puts "#{i} #{row.join(' ')}"
#     end
#   end

