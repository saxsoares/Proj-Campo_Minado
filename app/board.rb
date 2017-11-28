#!/usr/bin/env rubyc
# -*- ruby -*-

require 'matrix'
require_relative 'cell'

class Board
    attr_accessor :cell
    attr_accessor :bombs
    attr_accessor :flags
    attr_accessor :bombsFound
    attr_accessor :largura
    attr_accessor :altura

    def initialize(largura, altura, n_bombas)
        @largura = largura
        @altura  = altura
        @num_bombas = n_bombas

        @cell = Matrix.build(@largura, @altura) { |x, y| Cell.new(x, y) }

        @bombs = genBombs(@largura, @altura, n_bombas)
    end

    def to_s(show_all: false, xray: false)
        representacao = ""
        for i in (0...@altura)
            for j in (0...@largura)
                representacao <<  @cell[j,i].to_s(xray: xray)
            end
            representacao << "\n" unless i == (@largura - 1)
        end
        if show_all
            representacao << "\n" 
            representacao << "bombas: " + @bombs.to_s
        end
        representacao
    end

    def to_str
        to_s
    end

    #####################--Auxiliares--################################

    def print_coord
        for i in (0...@altura)
            for j in (0...@largura)
                print @cell[j,i].coordenates
            end
            print "\n"
        end
    end

    def genBombs(largura, altura, n_bombas)
        bombs_aux = []
        while n_bombas > 0
            x, y = rand(largura), rand(altura)
            if !bombs_aux.include?([x,y])
                bombs_aux << [x, y]
                @cell[x, y].isBomb = true
                n_bombas -= 1
            end            
        end
        bombs_aux
    end
end
