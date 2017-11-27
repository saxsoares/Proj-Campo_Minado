#!/usr/bin/env ruby
# -*- ruby -*-

require 'test/unit'
require_relative '../app/minesweeper'

class TestMineSweeper < Test::Unit::TestCase
    def test_new
        game = Minesweeper.new(10,10,5)

        assert_not_equal nil, game
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
    end

    def test_still_playing
    end

    def test_victory
    end

    def test_board_state
    end
end
