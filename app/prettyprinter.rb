#!/usr/bin/env ruby
# -*- ruby -*-

require 'matrix'
require_relative ('minesweeper')
require 'tk'

class PrettyPrinter
    def printt(m)
        h = {"|.|" => "|--|", "|B|" => "|B|", "|F|" => "|F|", "| |" => "|_|" }
        root = TkRoot.new { title "Fernando's Minesweeper" }
        texto = ""    
        (1..m.row_size).each {|lixo| texto << " + "}
        texto << "+\n+" 
        m.transpose.row_vectors.each do |i|
            i.each do |j| 
                texto << " " + (h[j] ? h[j] : j) + " " end
            texto << "+\n+"
        end
        (1..m.row_size).each {|lixo| texto << " + "}
        texto << "+\n"
        label = TkLabel.new(root) { text texto }
             
        label.pack 
        Tk.mainloop
    end
end
