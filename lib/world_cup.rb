require './lib/team'
require './lib/player'
require 'pry'

class WorldCup

  attr_reader :year, :teams
  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    @teams.flatten.group_by do |x|
      x == position
    end
    return @teams
  end
end
