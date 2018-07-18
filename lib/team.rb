class Team
  attr_reader   :country,
                :players
  attr_accessor :eliminated

  def initialize(country)
    @country = country
    @players = []
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(player_position)
    @players.find_all do |player|
      player.position == player_position
    end
  end


end
