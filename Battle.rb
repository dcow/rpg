# Copyleft Alexander Marrs, marrsale@live.com
# website: http://marrsale.herokuapp.com
# Github: github.com/marrsale

require 'rubygems'
require 'gosu'

require './Player'

class Battle

  #include Gvals
  
  def initialize(player1, player2, location)
    @p1 = player1
    @p2 = player2

    #draw appropriate background image per location

  end

  def update
    
  end

  def draw
    #draw background image = 0
    #draw player1 and player2 appropriately z = 1
    #draw menu/options and HUD z = 2
  end

  private
  
end
