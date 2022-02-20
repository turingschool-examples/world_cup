class WorldCup
  attr_reader :year, :teams
  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    players = []
    @teams.each do |team|
      if team.eliminated? == false
        players << team.players_by_position(position)
      end
    end
    players.flatten
  end

  def all_players_by_position
    players_by_pos = {}
    @teams.each do |team|
      team.players.each do |player|
        if !players_by_pos.has_key?(player.position)
          players_by_pos[player.position] = []
        end
        players_by_pos[player.position] << player
      end
    end
    players_by_pos
  end

end
