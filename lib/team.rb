class Team
  attr_reader :eliminated, :players

  def initialize(team, eliminated = false, players = [])
    @team = team
    @eliminated = eliminated
    @players = players
  end

  def country
    @team
  end

  def eliminated?
    @eliminated
  end

  def eliminated
    @eliminated = true
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    player_set = @players.find_all do |player|
      player.position == position
    end
    player_set
  end

end
