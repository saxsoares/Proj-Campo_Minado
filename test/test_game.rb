require_relative '../app/board'
require_relative '../app/minesweeper'

class TestBoard
    class T2
        def test_game
            @board = Board.new(6,4,2)
            print "\n"
            @board.print_coord
            print "\n"
            print @board.to_s(show_all: true, xray: true)
            print "\n"
        end
    end
    
    teste = T2.new
    teste.test_game
end
