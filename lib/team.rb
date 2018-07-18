class Team
  attr_reader :country, :players

  def initialize(country)
    @country = country
    @players = []
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end

  def add_player(player_name)
    @players << player_name
  end

  def players_by_position(position)
    @players.find_all do |player|
      player.position == position
    end
  end

  def create_team_position_hash

  end

  def eliminated
    @eliminated = true
  end
end
