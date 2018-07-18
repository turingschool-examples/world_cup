require './lib/team'
require './lib/player'

class WorldCup

  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year = year
    @teams = []
    teams.each do |team|
      @teams << team
    end
  end

  def active_players_by_position(search_position)
    active_players = []
    @teams.each do |team|
      if !team.eliminated?
        active_players = team.players_by_position(search_position)
      end
    end
    active_players
  end

  def all_players
    player_hash = {}
    @teams.each do |team|
      player_hash = team.players.group_by {|player| player.position}
    end
    player_hash.each do |key, value|
      
    end
  end
end
