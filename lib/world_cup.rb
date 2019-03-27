require './lib/team'

class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    active_teams = @teams.find_all {|team| !team.eliminated?}
    all_active_players = []

    active_teams.each do |active_team|
      all_active_players << active_team.players
    end

    all_active_players.flatten!
    all_active_players.find_all {|active_player| active_player.position == position}
  end
end
