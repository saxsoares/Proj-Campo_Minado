#!/usr/bin/env ruby
# -*- ruby -*-

require 'tk'
require 'matrix'
require_relative ('minesweeper')

class PrettyPrinter
    def printt(m, final: false)
        h = {"|.|" => "|--|", "|B|" => "|B|", "|F|" => "|F|", "| |" => "|_|" }
        h2 ={"|.|" => "| ",   "|B|" => "|B",  "|F|" => "|F",  "| |" => "|_" }
        if final then
            root = TkRoot.new { title "Fernando's Minesweeper" }
            texto = ""    
            (1..m.row_size).each {|lixo| texto << " + "}
            texto << "+\n+" 
            m.transpose.row_vectors.each do |i|
                i.each do |j| 
                    texto << (h[j] ? h[j] : j) + " " end
                texto << "+\n+"
            end
            (1..m.row_size).each {|lixo| texto << " + "}
            texto << "+\n"
            label = TkLabel.new(root) { text texto }
                 
            label.pack 
            Tk.mainloop
        else     
            (1..m.row_size).each {|lixo| print " +"}
            print " +\n+" 
            m.transpose.row_vectors.each do |i|
                i.each do |j| 
                    print (h2[j] ? h2[j] : j.sub(/\|([0-9])\|/) { "|" + $1 }) end
                print "|+\n+"
            end
            (1..m.row_size).each {|lixo| print " +"}
            print " +\n"
        end
    end
end
