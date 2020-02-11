class Team
  attr_reader :country, :players
  attr_accessor :eliminated

  def initialize(country_parameter)
    @country = country_parameter
    @eliminated = false
    @players = []
  end

  def eliminated?
    @eliminated
  end

  def add_player(player_parameter)
    @players << player_parameter
  end

  def players_by_position(position_parameter)
    @players.select { |player| player.position == position_parameter }
  end
end
