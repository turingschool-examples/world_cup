require "pry"
class WorldCup
  attr_reader :year, :teams
  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    active_players_at_position = []
    @teams.each do |team|
      if team.eliminated == false
        team.players.each do |player|
          if team.player.position == position
            active_players_at_position << player
          end
          # return active_players_at_position
        end
        return active_players_at_position
      end

    end
    #binding.pry
  end
end
