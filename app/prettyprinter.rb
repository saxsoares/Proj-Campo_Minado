#!/usr/bin/env ruby
# -*- ruby -*-

require 'tk'
require 'matrix'
require_relative ('minesweeper')

class PrettyPrinter
    def printt(m, final: false)
        h = {"|.|" => "|--|", "|B|" => "|B|", "|F|" => "|F|", "| |" => "|_|" }
        h2 ={"|.|" => "|.",   "|B|" => "|B",  "|F|" => "|F",  "| |" => "|_" }
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
            print "+"
            index =01
            (1..m.row_size).each {|lixo| print "-#{lixo}"}
            print "+\n01" 
            m.transpose.row_vectors.each do |i|
                i.each do |j| 
                    print (h2[j] ? h2[j] : j.sub(/\|([0-9])\|/) { "|" + $1 }) end
                    index += 1
                print index > 9 ? "|+\n#{index}" : "|+\n0#{index}"
            end
            (1..m.row_size).each {|lixo| print " +"}
            print " +\n"
        end
    end
end
