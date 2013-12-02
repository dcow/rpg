# Copyleft Alexander Marrs, marrsale@live.com
# website: http://marrsale.herokuapp.com
# Github: github.com/marrsale

require 'rubygems'
require 'gosu'

require './Player'

class Battle

  #include Gvals
  
  def initialize(player1, player2)
    @p1 = player1
    @p2 = player2

    #appropriate background image per location

  end

  def battle_over
    #determines if battle is over
  end

  def update
    
    while !battle_over
      
      p1_action = get_battle_action(@p1)
      p2_action = get_battle_action(@p2)
      
      #determine order, evaluate actions block
      if p1.initiative > p2.initiative
        result = calculate(p1_action, p2_action)
      end
      if p2.initiative > p1.initiative
        result = calculate(p2_action, p1_action)
      end
      if p2.initiative == p1.initiative
        #coin flip to decide
        if rand(2) == 0
          result = calculate(p1_action, p2_action)
        else
          result = calculate(p2_action, p1_action)
        end
      end

      
      display result
      
    end#while
    
  end

  def draw
    #draw background image = 0
    #draw player1 and player2 appropriately z = 1
    #draw menu/options and HUD z = 2
  end

  private
  
  #an action should be a hash, to include variable args:
  # key: the type of action the player chose
  def calculate(player1_action, player2_action)

    #run phase short circuits all other calculation (as it becomes unecessary)
    if player1_action[:key] == :run
      run!(@p1)
    end
    if player2_action[:key] == :run
      run!(@p2)
    end

    #item use phase precedes fight considerations
    if player1_action[:key] == :use
      use!(player1_action)
    end
    if player2_action[:key] == :use
      use!(player2_action)
    end

    #fight/switch phase
    if player1_action[:key] == :fight
      fight!(player1_action)
    end    
    if player1_action[:key] == :switch
      switch!(player1_action)
    end
    if player2_action[:key] == :fight
      fight!(player2_action)
    end
    if player2_action[:key] == :switch
      switch!(player2_action)
    end
  end#calculate

end
