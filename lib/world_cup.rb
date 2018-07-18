require 'pry'
require './lib/team.rb'


class WorldCup

  attr_reader :year,
              :teams


  def initialize(year, teams)
    @year = year.to_i
    @teams =teams
  end

# can i use the county method from my team or do i have
# nevermind stupid question i got it ,, wish i had more time :0
  def active_players_by_position(position)

    teams.map do |country|
      country.players_by_position(postion)
    end
  end









end
