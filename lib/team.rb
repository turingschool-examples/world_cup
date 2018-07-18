class Team
  attr_reader :country, :players, :eliminated

  def initialize(country)
    @country = country
    @players = []
    @eliminated = true
  end

  def eliminated?
    if eliminated == true
      true
    else false
    end
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    @players.find_all do |player|
      player.position == position
    end
  end


end
