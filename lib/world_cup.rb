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
    x = @teams.map do |team|
      team.players.map {|player| player.position.to_s.capitalize + "s"}
    end
    x
    require "pry"; binding.pry
  end
end
