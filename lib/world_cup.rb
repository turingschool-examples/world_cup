class WorldCup

  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    active_teams = @teams.reject { |team| team.eliminated? }
    active_teams.map { |team| team.players_by_position(position)}.flatten

  end


end
