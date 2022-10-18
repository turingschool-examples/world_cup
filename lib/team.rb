class Team
  attr_reader :country,
              :players

  attr_accessor :eliminated

  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    player_array = []
    @players.find_all do |player| 
      if player.position == position
        player_array << player
      end
    end
    player_array
  end
end