class WorldCup
  attr_reader :year, :teams

  def initialize(year_int, teams_array)
    @year = year_int
    @teams = teams_array
  end

  def active_players_by_position(position_str)
    @teams.select {|team| !team.eliminated?}.collect_concat do |team|
      team.players_by_position(position_str)
    end
  end
end
