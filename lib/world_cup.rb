class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    @teams.map {|team|
      if !team.eliminated?
        team.players_by_position(position)
      end
    }.flatten.compact
  end

end
