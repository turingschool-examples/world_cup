class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    all_players = []
    @teams.each do |team|
      unless team.eliminated?
        all_players << team.players_by_position(position)
      end
    end
    all_players.flatten
  end

end
