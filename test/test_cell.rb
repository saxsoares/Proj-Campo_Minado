require_relative '../app/board'
require_relative '../app/minesweeper'
require_relative '../app/cell'
require 'test/unit'

class TestBoard < Test::Unit::TestCase
    def test_neighborhood_cell
        @game = Minesweeper.new(6,6,4)
        
        assert_equal 3, @game.board.cell_at[0,0].vizinhos(6,6).size 
        assert_equal 3, @game.board.cell_at[5,5].vizinhos(6,6).size 
        assert_equal 3, @game.board.cell_at[0,5].vizinhos(6,6).size 
        assert_equal 3, @game.board.cell_at[5,0].vizinhos(6,6).size 
        
        assert_equal 5, @game.board.cell_at[0,1].vizinhos(6,6).size 
        assert_equal 5, @game.board.cell_at[0,4].vizinhos(6,6).size 
        assert_equal 5, @game.board.cell_at[5,1].vizinhos(6,6).size 
        assert_equal 5, @game.board.cell_at[5,4].vizinhos(6,6).size 
        assert_equal 5, @game.board.cell_at[1,0].vizinhos(6,6).size 
        assert_equal 5, @game.board.cell_at[4,0].vizinhos(6,6).size 
        assert_equal 5, @game.board.cell_at[1,5].vizinhos(6,6).size 
        assert_equal 5, @game.board.cell_at[4,5].vizinhos(6,6).size 
        
        assert_equal 8, @game.board.cell_at[1,1].vizinhos(6,6).size 
        assert_equal 8, @game.board.cell_at[4,1].vizinhos(6,6).size 
        assert_equal 8, @game.board.cell_at[1,4].vizinhos(6,6).size 
        assert_equal 8, @game.board.cell_at[4,4].vizinhos(6,6).size 
        assert_equal 8, @game.board.cell_at[3,2].vizinhos(6,6).size 
        assert_equal 8, @game.board.cell_at[2,3].vizinhos(6,6).size 
    end

    def test_cell_state
        @game = Minesweeper.new(6,6,7)
        
        for i in @game.board.cell_at 
            assert_equal "|#|", i.to_s
        end
    end    

end
