require'./lib/player.rb'
require'./lib/team.rb'


class WorldCup
  attr_reader :year,
              :teams,
              :player,
              :players,
              :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
    @players = players





  end

  def active_players_by_position(type)
#@teams.find_all do |players|
    #@players.find_all do |player|
       #player.position == type
    # end
end
     end

        @teams(@players).find_all do |player|
            player.position == type






end
