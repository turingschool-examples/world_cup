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
    teams_by_position = Hash.new
    teams_by_position = @teams.map do |team|
      team.players.group_by do |player|
        player.position
      end
    end
    teams_by_position
  end
end
