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
    active_players = []
    teams_not_eliminated.each do |team|
      team.players.find_all do |player|
        if player.position == player_position
          active_players << player
        end
      end
    end
    return active_players
  end
    #if they are not eliminated, iterate through each of those teams...
    #to find all player.position equal to player_position

end
