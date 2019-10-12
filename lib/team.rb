class Team
  attr_reader :country, :players

  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def eliminated?
    @eliminated
  end

  def eliminated=(boolean)
    @eliminated = boolean if boolean.class == TrueClass || value.class == FalseClass
  end

  def add_player(player_obj)
    @players << player_obj
  end

  def players_by_position(role_str)
    @players.find_all do |player|
      player.position == role_str
    end
  end
end
