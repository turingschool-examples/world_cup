require 'pry'
class Team
  attr_reader :country,
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

  def players_by_position(inquired_position)
    inquired_players = @players.find_all do |player|
      player.position == inquired_position
    end
    inquired_players
  end
end
