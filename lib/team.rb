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

end
