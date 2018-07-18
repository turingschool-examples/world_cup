class Team
  attr_reader :country, :players, :eliminated, :player_position,
              :add_player, :players_by_position

  def initialize(country)
    @country = country
    @players = []
    @player_position = []
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end

  def eliminated
    @eliminated = true
  end

  def add_player(player_input)
    @players << player_input
  end

  def players_by_position(position_input)
    @player_position << position_input
  end




end
