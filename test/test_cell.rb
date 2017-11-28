require_relative '../app/board'
require_relative '../app/minesweeper'
require_relative '../app/cell'

class TestBoard
    class T1
        def test_board
            @board = Board.new(6,6,2)
            print @board.to_s(show_all: true, xray: true)
            print "\n"
            print @board.cell[0,0].coordenates 
            print "\n"
            print @board.cell[0,0].vizinhos(4,4) 
            print "\n"
            print @board.cell[5,0].vizinhos(6,6) 
            print "\n"
            print @board.cell[0,5].vizinhos(6,6) 
            print "\n"
            print @board.cell[5,5].vizinhos(6,6) 
            print "\n"
            print @board.cell[0,2].vizinhos(6,6) 
            print "\n"
            print @board.cell[5,2].vizinhos(6,6) 
            print "\n"
        end
    end
    
    teste = T1.new
    teste.test_board
end
