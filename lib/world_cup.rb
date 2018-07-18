class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    players_by_position = []
    if @teams[0].eliminated? == false
      players_by_position << @teams[0].players_by_position(position)
    end
    if @teams[1].eliminated? == false
      players_by_position << @teams[1].players_by_position(position)
    end
    players_by_position.flatten(1)
  end
end
