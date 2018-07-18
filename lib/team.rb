class Team

  attr_reader   :country,
                :players

  def initialize(country)
    @country = country
    @players = []
    @standing = false
  end

  def eliminated?
    @standing
  end

  def eliminated
    @standing = true
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
