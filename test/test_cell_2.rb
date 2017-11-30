require_relative '../app/board'
require_relative '../app/minesweeper'
require_relative '../app/cell'
require 'test/unit'

class TestBoard 
    def test_cell_state
        @game = Minesweeper.new(6,6,10)
            
        print @game.board_state(xray: true, show_all: true)
        print "\n"
        

        # remember that method 'play' assumes coordinates from 1 to n
        for i in @game.board.cell_at
            @game.play(i.coord_x+1, i.coord_y+1)
        end

        print @game.board_state()
        print "\n"
    end    
end
    TestBoard.new.test_cell_state
