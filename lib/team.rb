require './lib/player'

class Team
  attr_reader :country,
              :players

  attr_writer :eliminated

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

  def players_by_position(search_position)
    @players.find_all do |player|
      search_position == player.position
    end
  end
end
