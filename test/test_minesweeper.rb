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
        assert_equal Minesweeper, game.class

        assert game.respond_to?(:play)
        assert game.respond_to?(:flag)
        assert game.respond_to?(:still_playing?)
        assert game.respond_to?(:victory?)
        assert game.respond_to?(:board_state)
    end

    def test_play
        game = Minesweeper.new(10,10,5)

        assert_equal false, game.play(11,1)
        assert_equal false, game.play(-1,1)
        assert_equal false, game.play(1,11)
        assert_equal false, game.play(11,11)
        assert_equal false, game.play(-1,-1)
        assert_equal true, game.play(10,1)
        assert_equal true, game.play(10,10)
        assert_equal true, game.play(1,1)
        assert_equal true, game.play(2,1)
        assert_equal true, game.play(1,2)
        assert_equal true, game.play(1,10)
        assert_equal false, game.play(1,10)
        assert_equal true, game.play(3,4)
        assert_equal false, game.play(3,4)
    end

    def test_flag
        game = Minesweeper.new(10,10,5)
        
        assert_equal false, game.flag(11,1)
        assert_equal false, game.flag(-1,1)
        assert_equal false, game.flag(1,11)
        assert_equal false, game.flag(11,11)
        assert_equal false, game.flag(-1,-1)
        assert_equal true, game.flag(10,1)
        assert_equal true, game.flag(10,10)
        assert_equal true, game.flag(1,1)
        assert_equal true, game.flag(2,1)
        assert_equal true, game.flag(1,2)
        assert_equal true, game.flag(1,10)
        assert_equal true, game.play(3,4)
        
        game.play(3,4)
        game.play(3,7)

        assert_equal false, game.flag(3,4)
        assert_equal false, game.flag(3,7)
    end

    def test_still_playing
    end

    def test_victory
    end

    def test_board_state
    end
end
