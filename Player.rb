# Copyleft Alexander Marrs, marrsale@live.com
# website: http://marrsale.herokuapp.com
# Github: github.com/marrsale

require 'rubygems'
require 'gosu'

require './Gvals'


#Player is meant to be an non-directly interactable scoreboard
#Direct control of the game is relegated to activity types, e.g. Battle, Overworld
class Player
  attr_accessor :x, :y

  include Gvals
  
  def initialize(option = {})
    @x = option[:x] || 0
    @y = option[:x] || 0
    
  end

  #Functional class (e.g. Overworld) passes info to update, player modifies its own internals
  def update(io_h)
    move(io_h)
  end

  def draw
  end

  private

  #for use in Overworld
  def move(io_h)
    if io_h[:left]
      @x -= 10
    end
    if io_h[:right]
      @x += 10
    end
    if io_h[:up]
      @y -= 10
    end
    if io_h[:down]
      @y += 10
    end
    
    @x %= 640
    @y %= 480
  end

  def appear(x, y)
    @x = x
    @y = y
  end

end
