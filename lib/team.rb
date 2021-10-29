class Team
  attr_reader :country,
              :players

  def initialize(country)
    @country = country
    @still_in = false
    @players = []
  end

  def eliminated?
    @still_in
  end

  def eliminated
    @still_in = true
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
