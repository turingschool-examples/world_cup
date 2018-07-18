class WorldCup

  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    active_teams = []
    @teams.each do |team|
      if team.eliminated? == false
        active_teams << team
      end
    end
    result = []
    active_teams.each do |team|
      result << team.players_by_position(position)
    end
    return result.flatten
  end

  def all_players
    defenders = []
    forwards = []
    midfielders = []
    goalies = []
    players = []
    @teams.each do |team|
    players << team.players
    end
    players.flatten.each do |player|
      if player.position == :defender
        defenders << player.name
      elsif player.position == :forward
        forwards << player.name
      elsif player.position == :midfielder
        midfielders << player.name
      elsif player.position == :goalie
        goalies << player.name
      end
    end
    binding.pry
    return "Defenders \n -#{defenders.join("\n-")}\n Forwards\n-#{forwards.join("\n-")}\nMidfielders\n-#{midfielders.join("\n-")}\nGoalies\n -#{goalies.join("\n-")}"
  end

end
