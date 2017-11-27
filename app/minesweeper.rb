#!/usr/bin/env ruby
# -*- ruby -*-

require_relative 'board'

class Minesweeper

    # Inicializar matrix de celulas 
    def initialize(largura, altura, nbombas)
        
        # Se numero de bombas maior que celulas, ou zero, 
        # inicializao invalida
        if nbombas >= (largura * altura) or nbombas <= 0
            return false
            # aprimoramento: criar e lancar excecao correspondente
        end
        
        # obtendo handler para o campo
        @board = Board.new(largura, altura, nbombas)
        @gameOver = false
        @victory = false
    end

    def play(x, y)
        x,y = x - 1, y - 1

        # Coordenadas devem estar dentro dos limites do campo:
        if x < 0 or y < 0 or @board.largura <= x or @board.altura <= y
            return false
        # Celula clicada nao pode estar clicada ou com bandeira
        elsif @board.cell[x,y].isClicked == true or 
              @board.cell[x,y].isFlagged == true
            return false
        else
            @board.cell[x,y].isClicked = true
            check_cell(x,y)
            return true
        end
    end

    def flag(x, y)
        x, y = x-1, y-1

        # Coordenadas devem estar dentro dos limites
        if x < 0 or y < 0 or @board.largura <= x or @board.altura <= y
            return false
        elsif @board.cell[x,y].isClicked == true
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
