# frozen_string_literal: true

require './lib/player'

# Team class
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

  def players_by_position(position)
    @players.select do |player|
      player.position == position
    end
  end

  def name_by_position(position)
    names = players_by_position(position).map do |player|
      player.name
    end
    names.sort
  end
end
