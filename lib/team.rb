require './lib/cup'

class Team 
  
  include Cup
  
  attr_reader :country, :players, :eliminated
  
  def initialize(country)
    @country = country
    @players = []
    @eliminated = eliminated
    @name = name
    @position = position
    @player = player
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