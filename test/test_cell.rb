require_relative '../app/board'
require_relative '../app/minesweeper'
require_relative '../app/cell'

class TestBoard
    class T1
        def test_board
            @board = Board.new(6,6,4)
            print @board.to_s(xray: true)
            print "\n"
            for i in @board.cell 
                print i.coordenates + ": "
                print @board.countBombsAround(i)
                print "\n"
            end
        end
    end
    
    teste = T1.new
    teste.test_board
end
