#!/usr/bin/env ruby
# -*- ruby -*-

require 'matrix'
require_relative ('minesweeper')

class SimplePrinter
    def printt(m)
        m.transpose.row_vectors.each do |i|
            i.each do |j| print j end
            print "\n"
        end
        print "\n"
    end
end
