require './lib/player'
require './lib/team'
require 'pry'

class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    french_players = @teams[0].players
    croatian_players = @teams[1].players
    active_players = []

    while @teams[0].eliminated? == false
      french_players.find_all do |player|
        if player.position == position
          active_players << player
        end
      end
      break
    end

    while @teams[1].eliminated? == false
      croatian_players.find_all do |player|
        if player.position == position
          active_players << player
        end
      end
      break
    end
    active_players
  end

  def all_players
    
  end
end
