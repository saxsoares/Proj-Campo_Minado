#!/usr/bin/env ruby
# -*- ruby -*-

require 'test/unit'
require_relative '../app/minesweeper'

class TestMineSweeper < Test::Unit::TestCase
    def test_new
        game = Minesweeper.new(10,10,5)

        assert_raise(ArgumentError) do
            largura_zero = Minesweeper.new(0,10,2)
        end
        assert_raise(ArgumentError) do 
            zero_bombas = Minesweeper.new(10,10,0)
        end
        assert_raise(ArgumentError) do
            excesso_bombas = Minesweeper.new(5,5,26)
        end
        assert_raise(ArgumentError) do
            largura_zero = Minesweeper.new(-1,10,2)
        end
        assert_raise(ArgumentError) do
            largura_zero = Minesweeper.new(10,-2,2)
        end
        assert_raise(ArgumentError) do
            largura_zero = Minesweeper.new(10,0,2)
        end
        assert_raise(ArgumentError) do
            largura_zero = Minesweeper.new(10,10,-2)
        end
        assert_equal Minesweeper, game.class

        assert game.respond_to?(:play)
        assert game.respond_to?(:flag)
        assert game.respond_to?(:still_playing?)
        assert game.respond_to?(:victory?)
        assert game.respond_to?(:board_state)
    end

    def test_play
        game = Minesweeper.new(10,10,50)
        
        assert(false, "Deveria ser true, mas estes testes nao irao mais funcionar devido a aleatoriedade do game. Foram uteis no inicio do projeto")
        assert_equal false, game.play(10,0)
        assert_equal false, game.play(-1,0)
        assert_equal false, game.play(0,10)
        assert_equal false, game.play(10,10)
        assert_equal false, game.play(-1,-1)
        assert_equal true, game.play(9,0)
        assert_equal game.board.altura, 10
        assert_equal game.board.largura, 10
        assert_equal true, game.play(9,9)
        assert_equal true, game.play(0,0)
        assert_equal true, game.play(1,0)
        assert_equal true, game.play(0,1)
        assert_equal true, game.play(0,9)
        assert_equal false, game.play(0,9)
        assert_equal true, game.play(2,3)
        assert_equal false, game.play(2,3)
    end

    def test_flag
        game = Minesweeper.new(10,10,5)
        
        assert_equal false, game.flag(10,0)
        assert_equal false, game.flag(-1,0)
        assert_equal false, game.flag(0,10)
        assert_equal false, game.flag(10,10)
        assert_equal false, game.flag(-1,-1)
        assert_equal true, game.flag(9,0)
        assert_equal true, game.flag(9,9)
        assert_equal true, game.flag(0,0)
        assert_equal true, game.flag(1,0)
        assert_equal true, game.flag(0,1)
        assert_equal true, game.flag(0,9)
        assert_equal true, game.play(2,3)
        
        game.play(2,3)
        game.play(2,6)

        assert_equal false, game.flag(2,3)
        assert_equal false, game.flag(2,6)
    end

    def test_still_playing
        game = Minesweeper.new(10,10,5)
        
        assert_equal true, game.still_playing?

        x, y  = rand(10), rand(10)
        game.play(x, y) unless game.board.cell_at[x, y].isBomb
        assert_equal true, game.still_playing?
        
        x, y  = rand(10), rand(10)
        game.play(x, y) unless game.board.cell_at[x, y].isBomb
        assert_equal true, game.still_playing?
        
        x, y  = rand(10), rand(10)
        game.play(x, y) unless game.board.cell_at[x, y].isBomb
        assert_equal true, game.still_playing?
    end

    def test_victory
        game = Minesweeper.new(10,10,50)

        while game.still_playing?
            x, y  = rand(10), rand(10)
            game.play(x, y) unless game.board.cell_at[x, y].isBomb
        end
        
        assert_equal true, game.victory?
    end

    def test_board_state
    end
end
