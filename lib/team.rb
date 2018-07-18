class Team
  attr_accessor :country,
                :eliminated,
                :players

  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    @players.select { |player| player.position == position }
  end
end
