# frozen_string_literal: true

# World Cup class
class WorldCup
  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year  = year
    @teams = teams
  end

  def active_teams
    @teams.select do |team|
      team.eliminated? == false
    end
  end

  def active_players_by_position(position)
    players = active_teams.collect do |team|
      team.players_by_position(position)
    end
    players.flatten
  end

  def all_positions
    positions = []
    @teams.each do |team|
      team.players.each do |player|
        positions << player.position
      end
    end
    positions.uniq.sort
  end

  def all_players
    return_string = String.new
    all_positions.each do |position|
      return_string << position.to_s.capitalize + "s\n"
      @teams.each do |team|
        team.name_by_position(position).each do |player|
          return_string << "\t- #{player}\n"
        end
      end
      return_string << "\n"
    end
    return_string.chomp.chomp
  end
end
