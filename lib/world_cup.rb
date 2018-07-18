require './lib/player'
require './lib/team'
require 'pry'

class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
    @player_hash = {}
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
    @player_hash = position[active_players_by_position(position)]
    # My thought process is this: In the active_players_by_position
    # method, we input a position that returns us the players
    # of that position. So if I'm able to make a Hash
    # with the position as the key, and the return of the
    # method as the value, I should be able to have easy
    # access to print the key and value pairs.
    # Or should I have made that hash of hashes earlier on?
    # Now I'm thinking so lol 
  end
end
