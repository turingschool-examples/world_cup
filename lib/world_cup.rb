class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    @teams.map do |team|
      if !team.eliminated?
        team.players_by_position(position)
      end
    end.flatten
  end

  def all_players
  end

  def get_positions
    players = @teams.map do |team|
      team.players
    end.flatten
    positions = players.map do |player|
      player.position
    end.uniq
  end

  def makes_keys
    player_hash = {}
    get_positions.each do |position|
      player_hash[position] = nil
    end
    player_hash
  end

  def format_titles
    sorted_titles = makes_keys.keys.sort
    sorted_titles.map do |title|
      title.to_s.capitalize + "s"
    end
  end

  def players_into_values
    player_hash

  end

end
