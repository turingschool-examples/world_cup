class WorldCup
  
  include Cup
  
  attr_reader :year, :teams
  
  def initialize(year, teams)
    @year = year
    @teams = Team.new(country)
    @position = position
  end
  
  def active_players_by_position(position)
    
  end
  
  
end
  