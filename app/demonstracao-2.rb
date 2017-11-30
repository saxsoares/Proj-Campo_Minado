#!/usr/bin/env ruby
# -*- ruby -*-

require 'test/unit'
require_relative '../app/minesweeper'
require_relative '../app/simpleprinter'

class TestMineSweeper 
    def test_new
            print %{
#####################################################
#                                                   #
#           MINESWEEPER GAME                        #
#                               by Fernando Soares  #
#####################################################
#\n}                               
        puts "Please, enter a valid limits to a board <x, y>: "
        width, height = gets.split.map(&:to_i)
        puts "Now, tell me how many bombs you want to hunt <num>: "
        num_mines = gets.chomp.to_i
        game = Minesweeper.new(width, height, num_mines)
        SimplePrinter.new.printt(game.board_state)
        while game.still_playing?
            puts  "Enter an operation <(f)[lag] | (p)[lay]>: "
            op = gets.chomp[/[fp]/]
            if op != "p" and op != "f"
                puts "Operation unknown: #{op}"
                next
            end
            puts  "And now, enter a cell coordenate <x, y>:\n"
            x, y = gets.split.map(&:to_i)
            if op == "p"
                valid_move = game.play(x, y)
                print "play(#{x}, #{y})\n"
            elsif op == "f"
                valid_flag = game.flag(x, y)
                print "flag(#{x}, #{y})\n"
            end
            if valid_move or valid_flag
                printer = (rand > 0.5) ? SimplePrinter.new : PrettyPrinter.new
                printer.printt(game.board_state)
            end
        end
    
        puts "Fim do jogo!" 
        if game.victory?
            puts "Você venceu!"
        else
            puts "Você perdeu! As minas eram:"
            PrettyPrinter.new.printt(game.board_state(xray: true), final: true)
            print "\n"
        end
    end
end

t = TestMineSweeper.new
t.test_new
