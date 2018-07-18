require 'pry'

class Team
  attr_reader :country,
              :players,
              :eliminated
  def initialize(country, eliminated = false)
    @country = country
    @players = []
    @eliminated = eliminated
  end

  def eliminated
    @eliminated = true
  end

  def eliminated?
   @eliminated 
  end

  def add_player(player)
  @players << player
  end

  def player_by_position(position)
    @players.find_all do |find|
            
      
    #I know this isn't the right way...
  end

end