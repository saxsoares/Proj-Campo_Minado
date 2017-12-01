require_relative '../app/board'
require_relative '../app/minesweeper'

class TestBoard
    class T1
        def test_board
            @board = Board.new(4,4,2)
            print @board.to_s(xray: true)
            print "\n"
        end
    end
    
    teste = T1.new
    teste.test_board
end
