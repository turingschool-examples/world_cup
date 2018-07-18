require "pry"

class Team
  attr_reader :country, :players, :eliminated
  def initialize(country)
    @country = country
    @players = []
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end

  def eliminated
    @eliminated = true
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    players_at_position = []
    @players.each do |player|
      if player.position == position
        players_at_position << player
      end
    end
    return players_at_position
  end
end
