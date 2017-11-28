#!/usr/bin/env ruby
# -*- ruby -*-

require_relative 'board'

class Minesweeper
    
    def initialize(largura, altura, nbombas)
         
        raise ArgumentError if (nbombas >= (largura * altura) or nbombas <= 0 or largura <= 0 or altura <= 0)
    
        @board = Board.new(largura, altura, nbombas)
        @gameOver = false
        @victory = false
    end
    
    def play(coord_x, coord_y)
        coord_x, coord_y = coord_x - 1, coord_y - 1

        if (coord_x < 0) or (coord_y < 0) or (@board.largura <= coord_x) or (@board.altura <= coord_y)
            return false
        elsif @board.cell_at[coord_x, coord_y].isClicked  or 
              @board.cell_at[coord_x, coord_y].isFlagged 
            return false
        else
            @board.cell_at[coord_x, coord_y].isClicked = true
            check_cell_at(coord_x, coord_y)
            return true
        end
    end

    def flag(coord_x, coord_y)
        coord_x, coord_y = coord_x-1, coord_y-1

        if (coord_x < 0) or (coord_y < 0) or (coord_x >= @board.largura) or (coord_y >= @board.altura)
            return false
        elsif @board.cell_at[coord_x, coord_y].isClicked
            return false
        else
            @board.cell_at[coord_x, coord_y].isFlagged = @board.cell_at[coord_x, coord_y].isFlagged ? false : true
            return true
        end
    end

    def still_playing?
        return !@gameOver
    end

    def victory?
        return (@gameOver and @victory)
    end

    def board_state(xray: false)
        if(@gameOver)
            @board.to_s(xray: xray)
        else
            @board.to_s(xray: false)
        end
    end

    def check_cell_at(coord_x, coord_y)
        if @board.cell_at[coord_x, coord_y].isBomb
            @gameOver = true
        elsif !@board.cell_at[coord_x, coord_y].hadBombNear
            expand(coord_x, coord_y)
        end
    end

    def expand(coord_x, coord_y)
    end
end
