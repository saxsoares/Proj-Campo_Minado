#!/usr/bin/env rubyc
# -*- ruby -*-

class Cell
    attr_accessor :isClicked 
    attr_accessor :isFlagged 
    attr_accessor :isBomb 

    def initialize
        @isCliecked = false
        @isFlagged = false
        @isBomb = false
    end
end

class Board
    def new_board(largura, altura, nbombas)
        @board ||= Array.new(largura) { Array.new(altura) { Cell.new } }
        @board
    end
end

