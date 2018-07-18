class Team

  attr_reader :country,
              :players

  def initialize(country)
    @country = country
    @players = []

  end

  def eliminated?
    false
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(player_instance)
    players_in_position = player_instance

    player_instance.each do |person|
      if person.position == player_instance
        players_in_position = person
      end
    end
     return players_in_position
  end

end
