# frozen_string_literal: true

# World Cup class
class WorldCup
  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year  = year
    @teams = teams
  end

  def active_players_by_position(position)
    active_teams = @teams.select do |team|
      team.eliminated? == false
    end

    players = active_teams.collect do |team|
      team.players_by_position(position)
    end
    players.flatten
  end
end
