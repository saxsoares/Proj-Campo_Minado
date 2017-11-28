#!/usr/bin/env ruby
# -*- ruby -*-

require_relative 'board'

class Minesweeper
    
    def initialize(largura, altura, nbombas)
         
        if nbombas >= (largura * altura) or nbombas <= 0
            return false
            # aprimoramento: criar e lancar excecao correspondente
        end
        
        @board = Board.new(largura, altura, nbombas)
        @gameOver = false
        @victory = false
    end

    def play(x, y)
        x,y = x - 1, y - 1

        if x < 0 or y < 0 or @board.largura <= x or @board.altura <= y
            return false
        elsif @board.cell[x,y].isClicked  or 
              @board.cell[x,y].isFlagged 
            return false
        else
            @board.cell[x,y].isClicked = true
            check_cell(x,y)
            return true
        end
    end

    def flag(x, y)
        x, y = x-1, y-1

        if x < 0 or y < 0 or x >= @board.largura or y >= @board.altura
            return false
        elsif @board.cell[x,y].isClicked
            return false
        else
            @board.cell[x,y].isFlagged = @board.cell[x,y].isFlagged ? false : true
            return true
        end
    end

    def still_playing?
    end

    def victory?
    end

    def board_state(xray: false)
        board.to_s
    end

    private def check_cell(x, y)
    end

    private def expand
    end
end
