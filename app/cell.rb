#!/usr/bin/env rubyc
# -*- ruby -*-

require 'matrix'

class Cell
    attr_accessor :isClicked 
    attr_accessor :isFlagged 
    attr_accessor :isBomb 
    attr_accessor :isEmpty
    attr_accessor :hadBombNear
    attr_accessor :numBombsNear
    attr_reader :coord_x 
    attr_reader :coord_y 
    def initialize(x, y)
        @coord_x      = x 
        @coord_y      = y 
        @isClicked    = false
        @isFlagged    = false
        @isBomb       = false
        @isEmpty      = true 
        @hadBombNear  = false
        @numBombsNear = 0
    end 
    def to_s(xray: false, show_all: false)
        if @isBomb and ( xray or show_all )
            return "|B|"
        elsif show_all and @hadBombNear
            return "|#{@numBombsNear}|"
        elsif @isFlagged 
            return "|F|"
        elsif !@isClicked
            return "|.|"
        elsif @isBomb
            return "|B|"
        elsif @isEmpty
            return "| |"
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

