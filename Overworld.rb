# Copyleft Alexander Marrs, marrsale@live.com
# website: http://marrsale.herokuapp.com
# Github: github.com/marrsale

require 'rubygems'
require 'gosu'
require 'json'

require './Player'
require './Gvals'


#overworld is the class for walking around the landscape at large
class Overworld

  #TODO: Create a Gvals module to store values
  include Gvals

  def initialize(window, player)

 
    @background_img = Gosu::Image.new(window, "hellscape.png", false)
    
    @player = player 
    @player_img = Gosu::Image.new(window, "overworld_player.png", false)
    
    #entities, batch initialized and added to an array
  end

  def update(io)
    @player.update(io)
  end
  
  def draw
    #draw background image z=0
    @background_img.draw(0,0,0, 1.15, 1.3)

    #draw player and entities images z=1
    @player_img.draw(@player.x, @player.y, 1, 0.2, 0.2)
    

  end
end
