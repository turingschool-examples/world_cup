class WorldCup
  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def teams_not_eliminated
    @teams.find_all do |team|
      team.eliminated? == false
    end
  end

  def active_players_by_position(player_position)
    teams_not_eliminated.find_all_with_index do |team, i|
      new_player_array = team.players.find_all do |player|
      player.position == player_position
    end
    return new_player_array
    end
  end
    #if they are not eliminated, iterate through each of those teams...
    #to find all player.position equal to player_position

end
