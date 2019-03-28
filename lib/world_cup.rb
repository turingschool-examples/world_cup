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

  def all_players_by_position
    all_players = {}
    @teams.each do |team|
      team.players.each do |player|
        unless all_players.keys.include?(player.position)
          all_players[player.position] = [player]
        else
          all_players[player.position] << player
        end
      end
    end
    all_players
  end

end
