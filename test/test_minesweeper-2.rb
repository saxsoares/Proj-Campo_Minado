#!/usr/bin/env ruby
# -*- ruby -*-

require 'test/unit'
require_relative '../app/minesweeper'

class TestMineSweeper 
    def test_new
        width, height, num_mines = 10, 10, 1
        game = Minesweeper.new(width, height, num_mines)
        while game.still_playing?
            x, y = rand(width), rand(height)
            valid_move = game.play(x, y)
            print "play(#{x}, #{y})\n"
            x, y = rand(width), rand(height)
            valid_flag = game.flag(x, y)
            print "flag(#{x}, #{y})\n"
            if valid_move or valid_flag
                #printer = (rand > 0.5) ? SimplePrinter.new : PrettyPrinter.new
                print(game.board_state())
                print "\n"
            end
            print "\n"
        end
    
        puts "Fim do jogo!" 
        if game.victory?
            puts "Você venceu!"
        else
            puts "Você perdeu! As minas eram:"
            print(game.board_state(xray: true))
            print "\n"
        end
    end
end

t = TestMineSweeper.new
t.test_new
