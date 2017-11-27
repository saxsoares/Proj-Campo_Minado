#!/usr/bin/env rubyc
# -*- ruby -*-

require 'matrix'

class Cell
    attr_accessor :isClicked 
    attr_accessor :isFlagged 
    attr_accessor :isBomb 
    attr_accessor :isClean
    def initialize
        @isClicked  = false
        @isFlagged  = false
        @isBomb     = false
        @isClean    = false
    end
    def to_s
        bombs_near = 1
        if @isClicked == false
            return "|#|"
        elsif @isClean == true
            return "|_|"
        elsif @isFlagged == true
            return "|F|"
        elsif @isBomb == true
            return "|B|"
        else
            return "|#{bombs_near}|"
        end
    end
    def to_str
        to_s
    end
end

class Board
    attr_accessor :cell
    attr_accessor :bombs
    attr_accessor :flags
    attr_accessor :bombsFound
    attr_accessor :largura
    attr_accessor :altura
    def initialize(largura, altura, nbombas)
        @largura = largura
        @altura = altura
        @nbombas = nbombas

        @cell = Matrix.build(altura, largura) { Cell.new }

        @bombs = []
        while nbombas > 0
            x, y = rand(largura), rand(altura)
            if !@bombs.include?([x,y])
                @bombs << [x, y]
                @cell[x,y].isBomb = true
                nbombas -= 1
            end            
        end
    end

    def to_s
        representacao = ""
        for i in (0...@largura)
            for j in (0...@altura)
                representacao <<  @cell[i,j].to_s
            end
            representacao << "\n" 
        end
        representacao << "bombas: " + @bombs.to_s
    end

    def to_str
        to_s
    end
end
