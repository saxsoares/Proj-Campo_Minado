require_relative '../app/board'

class TestBoard
    class T1
        def test_board
            @board = Board.new.new_board(2,2,1)

            print @board
            print "\n"
        end
    end

    teste = T1.new
    teste.test_board
end
