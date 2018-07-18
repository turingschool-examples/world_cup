class WorldCup
  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    team_eliminated?
    @teams.map do |team|
      team.players_by_position(position)
    end.flatten
  end

  def team_eliminated?
    @teams.map do |team|
      if team.eliminated? == true
        @teams.delete(team)
      end
    end
    @teams
  end

  def all_players
    format_position

  end

  def format_position
    @teams.map do |team|
      require "pry"; binding.pry
      team.players.position..to_s.upcase + "s"
    end
  end
end
