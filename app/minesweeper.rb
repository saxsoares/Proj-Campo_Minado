#!/usr/bin/env ruby
# -*- ruby -*-

require_relative 'board'

class Minesweeper
    
    def initialize(largura, altura, nbombas)
        @board = Board.new.new_board(largura, altura, nbombas)
    end

    def play(x, y)
    end

    def flag(x, y)
    end

    def still_playing?
    end

    def victory?
    end

    def board_state(xray: false)
    end

    private def check_cell
    end

    private def expand
    end
end
