#!/usr/bin/env ruby
# -*- ruby -*-

require_relative 'board'
require_relative 'simpleprinter'
require_relative 'prettyprinter'

class Minesweeper

    attr_accessor :board 
    
    def initialize(largura, altura, nbombas)
        raise ArgumentError if (nbombas >= (largura * altura) or nbombas <= 0 or largura <= 0 or altura <= 0)
    
        @board      = Board.new(largura, altura, nbombas)
        @gameOver   = false
        @victory    = false
        @cells_to_open = (altura * largura) - nbombas
        @cells_openned = 0
        @cells_flagged = 0
    end
    #-------------------------------------------------------------------------
    #-------------------------------------------------------------------------
    def play(coord_x, coord_y)
        
        # If game is over, don't play
        return false if @gameOver
        
        # If coordenates is wrong, don't play
        if (coord_x < 0) or (coord_y < 0) or (@board.largura <= coord_x) or (@board.altura <= coord_y)
            return false
        # If cell is clicked or flagged, don't play
        elsif @board.cell_at[coord_x, coord_y].isClicked  or 
              @board.cell_at[coord_x, coord_y].isFlagged 
            return false
        else
            @board.cell_at[coord_x, coord_y].isClicked = true
            @cells_openned += check_cell_at(coord_x, coord_y) 
            return true
        end
    end
    #-------------------------------------------------------------------------
    #-------------------------------------------------------------------------
    def flag(coord_x, coord_y)
        cell = @board.cell_at[coord_x, coord_y]
        if (coord_x < 0) or (coord_y < 0)   or 
           (coord_x >= @board.largura)      or 
           (coord_y >= @board.altura)
            return false
        elsif cell.isClicked
            return false
        else
            if cell.isFlagged 
                cell.isFlagged = false
            else
                cell.isFlagged = true
            end

            return true
        end
    end
    #-------------------------------------------------------------------------
    #-------------------------------------------------------------------------
    def still_playing?
        if @cells_openned == @cells_to_open
            @victory = true
            @gameOver = true
            return false
        end
       true
    end
    #-------------------------------------------------------------------------
    #-------------------------------------------------------------------------
    def victory?
        return @victory
    end
    #-------------------------------------------------------------------------
    #-------------------------------------------------------------------------
    def board_state(xray: false)
        if(@gameOver)
            @board.to_s(xray: xray )
        else
            @board.to_s(xray: false)
        end
    end
    #-------------------------------------------------------------------------
    #-------------------------------------------------------------------------

    def check_cell_at(coord_x, coord_y)
        cell = @board.cell_at[coord_x, coord_y]
        if cell.isBomb
            @gameOver = true
            return 0
        elsif !cell.hadBombNear
            expand(cell)
            return 1
        end
        return 1
    end
    #-------------------------------------------------------------------------
    #-------------------------------------------------------------------------

    def expand(cell)
        cell.vizinhos(@board.largura, @board.altura).each do |coord_x, coord_y|
            self.play(coord_x, coord_y)
        end
    end
end
