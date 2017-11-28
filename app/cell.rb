#!/usr/bin/env rubyc
# -*- ruby -*-

require 'matrix'

class Cell
    attr_accessor :isClicked 
    attr_accessor :isFlagged 
    attr_accessor :isBomb 
    attr_accessor :isClean
    attr_accessor :hadBombNear
    attr_accessor :numBombsNear
    attr_accessor :coord_x 
    attr_accessor :coord_y 
    attr_accessor :neighbors
    def initialize(x, y)
        @coord_x = x 
        @coord_y = y 
        @isClicked  = false
        @isFlagged  = false
        @isBomb     = false
        @isClean    = false
        @hadBombNear = false
        @numBombsNear = 0
    end 
    def to_s(xray: false)
        @xray = xray
        if @xray and @isBomb
            return "|B|"
        elsif @xray and @hadBombNear
            return "|#{@numBombsNear}|"
        elsif @isClicked == false
            return "|#|"
        elsif @isFlagged 
            return "|F|"
        elsif @isBomb
            return "|B|"
        elsif @isClean
            return "|_|"
        elsif @hadBombNear
            return "|#{@numBombsNear}|"
        else    
            return "|ER|"
        end
    end 
    def to_str
        to_s
    end 
    def coordenates
        return "[#{@coord_x}, #{@coord_y}]"
    end 
    def vizinhos(largura, altura)
        neighbors =[[@coord_x-1, @coord_y-1], [@coord_x, @coord_y-1], [@coord_x+1, @coord_y-1], 
                    [@coord_x-1, @coord_y ],                          [@coord_x+1, @coord_y  ], 
                    [@coord_x-1, @coord_y+1], [@coord_x, @coord_y+1], [@coord_x+1, @coord_y+1]]
        myNeighbors = []
        for viz in neighbors
            if !(viz[0] < 0 or viz[0] >= largura or viz[1] < 0 or viz[1] >= altura)
                myNeighbors << viz
            end
        end
        myNeighbors
    end
end

