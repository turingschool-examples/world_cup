require './lib/player.rb'
class Team
  attr_reader :country,
              :players,
              :player
              :eliminated


  def initialize(country, eliminated = false)
    @country = country
    @players = [ ]
  @eliminated = eliminated


  end
  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players.push(player)
  end

def players_by_position(type)
  @players.find_all do |player|
     player.position == type

   end
 end
end
