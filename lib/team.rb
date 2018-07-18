require './lib/player'

class Team

  attr_reader :country,
              :players

  def initialize(country)
    @country = country
    @players = []
    @eliminated = false
  end

  def add_player(player)
    @players << player
  end

  def eliminated?
    @eliminated
  end

  def eliminated
    if @eliminated == false
      @eliminated = true
    end
  end

  def players_by_position(position)
    return_value = []
    @players.each do |player|
      if player.position == position
        return_value << player
      end
    end
    return return_value
  end

end
