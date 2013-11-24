# Copyleft Alexander Marrs, marrsale@live.com
# website: http://marrsale.herokuapp.com
# Github: github.com/marrsale

##Some reference cred: https://github.com/jlnr/gosu/wiki/Ruby-Tutorial

require 'rubygems'
require 'gosu'

require './Player'
require './Overworld'
require './Battle'
require './Gvals'

#this is teh loop
class MyWindow < Gosu::Window
  include Gvals

  def initialize
    super(Gvals::WIDTH, Gvals::HEIGHT, false)
    
    #init player
    @player = Player.new 

    @overworld = Overworld.new(self, @player)
   
  end

  def update
    io = Hash.new
    if button_down? Gosu::KbLeft
      io[:left] = true
    end
    if button_down? Gosu::KbRight
      io[:right] = true
    end
    if button_down? Gosu::KbUp
      io[:up] = true
    end
    if button_down? Gosu::KbDown
      io[:down] = true
    end

    @overworld.update(io)
  end

  def draw
    #maybe create an object variable to point at current activity class (e.g. overworld, battle, dungeon), then call its draw method 
    @overworld.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

w = MyWindow.new
w.show
