require 'pry'
class WorldCup
  attr_reader :year,
              :teams
  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(inquired_position)

    if  active_teams = @teams.find_all do |team|
          team.eliminated? == false
        end
          active_players = active_teams.map do |team|
              team.players.find_all do |player|
                player.position == inquired_position
              end
          end
        active_players.flatten
    end
  end

end
