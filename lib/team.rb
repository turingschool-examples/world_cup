require "pry"
require "./lib/player"

class Team
  attr_reader :country, :players
  attr_accessor :eliminated, :positions
  def initialize(country)
    @country = country
    @players = []
    @eliminated = false
    @positions = []
  end

  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players << player
    @positions << player.position
  end

  def players_by_position(position)
    players.select do |player|
      player.position == position
    end
  end

end
