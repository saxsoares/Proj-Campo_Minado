require_relative '../app'

class TestBoard
    class T1
        def test_board
            @board = Board.new(4,4,2)
            print @board
            print "\n"
        end
    end
    
    teste = T1.new
    teste.test_board
end
