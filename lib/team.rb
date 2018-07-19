require './lib/player'

class Team 
  
  attr_reader       :country,
                    :players,
                    :eliminated 
  
  def initialize(country)
    @country = country
    @players = []
    @eliminated = false 
  end 
  
  def eliminated?
    @eliminated 
  end 
  
  def eliminated
    @eliminated = true
  end 
  
  def add_player(player)
    @players << player 
  end 
  
  def players_by_position(position)
    @players.find_all do |player|
      player.position == position 
    end 
  end 
end 