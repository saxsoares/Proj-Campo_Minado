#!/usr/bin/env rubyc
# -*- ruby -*-

require 'matrix'
require_relative 'cell'

class Board
    attr_accessor :cell_at
    attr_accessor :bombs
    attr_reader   :largura
    attr_reader   :altura
    attr_reader   :num_bombs
#-------------------------------------------------------------------------------------------- 
#-------------------------------------------------------------------------------------------- 
    def initialize(largura, altura, n_bombas)
        @altura     = altura
        @largura    = largura
        @num_bombs  = n_bombas
        @cell_at = Matrix.build(@largura, @altura) { |coord_x, coord_y| Cell.new(coord_x, coord_y) }

        @bombs = genBombs(@largura, @altura, n_bombas)
        for oneCell in @cell_at
            oneCell.numBombsNear = countBombsAround(oneCell)
            if oneCell.numBombsNear > 0
                oneCell.hadBombNear = true
                oneCell.isEmpty = false
            end
        end
    end
#-------------------------------------------------------------------------------------------- 
#-------------------------------------------------------------------------------------------- 
    def to_s(xray: false)
        status =  Matrix.build(@largura, @altura) {|coord_x, coord_y| @cell_at[coord_x, coord_y].to_s(xray: xray)}
    end
#-------------------------------------------------------------------------------------------- 
#-------------------------------------------------------------------------------------------- 
    def to_str
        to_s
    end
#-------------------------------------------------------------------------------------------- 
#-------------------------------------------------------------------------------------------- 
    def print_coord
        for i in (0...@altura)
            for j in (0...@largura)
                print @cell_at[j,i].coordenates
            end
            print "\n"
        end
    end
#-------------------------------------------------------------------------------------------- 
#-------------------------------------------------------------------------------------------- 
    def genBombs(largura, altura, n_bombas)
        bombs_aux = []
        while n_bombas > 0
            coord_x, coord_y = rand(largura), rand(altura)
            if !bombs_aux.include?([coord_x, coord_y])
                bombs_aux << [coord_x, coord_y]
                @cell_at[coord_x, coord_y].isBomb = true
                n_bombas -= 1
            end            
        end
        bombs_aux
    end
#-------------------------------------------------------------------------------------------- 
#-------------------------------------------------------------------------------------------- 
    def countBombsAround(oneCell)
        aux = []
        for vizinho in oneCell.vizinhos(@largura, @altura)
            aux << @cell_at[vizinho[0], vizinho[1]]
        end
        aux.select {|i| i.isBomb == true }.count
    end
end
