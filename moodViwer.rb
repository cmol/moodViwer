#!/usr/bin/ruby

# ZetCode Ruby Qt tutorial
#
# This program draws ten
# rectangles with different
# levels of transparency.
#
# author: jan bodnar
# website: www.zetcode.com
# last modified: June 2009

require 'Qt'

class QtApp < Qt::Widget

    def initialize
        super

        setWindowTitle "Transparent rectangles"

        resize 1000, 200
        move 300, 300

        show
    end


    def paintEvent event

          painter = Qt::Painter.new self

          drawRectangles painter
          painter.end
    end


    def drawRectangles painter

        painter.setPen Qt::NoPen

        s = File.binread(ARGV[0])
        bytes = s.unpack("C*")

        for i in 0..999
            painter.setBrush Qt::Brush.new Qt::Color.new bytes[i*3].to_i, bytes[i*3+1].to_i, bytes[i*3+2].to_i, 255
            painter.drawRect i, 0, 1, 200

        end

    end
end

app = Qt::Application.new ARGV
QtApp.new
app.exec
