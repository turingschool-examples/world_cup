require "pry"

class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    players_by_position = []
    @teams.each do |team|
      if team.eliminated? == false
        players_by_position << team.players_by_position(position)
      end
    end
    players_by_position.flatten(1)
  end

  # def all_players(active = true)
  #   if active == true
  #     active_teams = @teams.find_all {|team| team.eliminated? == false}
  #   else
  #     active_teams = @teams
  #   end
  #
  #   players = []
  #   active_teams.each {|team| players << team.players}
  #   players.flatten(1)
  #   active_positions = players.uniq {|player| player.position}
  #   binding.pry
  #   # #sort the positions and capitalize
  #   # active_positions.map {|position| position.capitalize.concat("s")}
  #   #
  #   # active_positions.sort
  #   # #print the positions
  #   #
  #   # #go through each position and get active players
  #   # player_list = active_positions.each {|position| active_players_by_position(position)}
  #   # #sort the player list
  #   # player_list.capitalize.sort
  #   #
  #   # #print it all out
  #   # all_players_string = ""
  #   #
  #   # active_positions.each do |position|
  #   #
  #   # end
  # end
end
