class WorldCup
  attr_reader :year

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def teams
    @teams.find_all do |team|
      team.eliminated == false
    end
  end

  def active_players_by_position(position)
    active_players = []
    teams.each do |team|
      team.players.each do |player|
        active_players << player if player.position == position
      end
    end
    active_players
  end

  def all_players
    defenders = active_players_by_position(:defender)
    midfielders = active_players_by_position(:midfielder)
    forwards = active_players_by_position(:forward)
    goalkeepers = active_players_by_position(:goalkeepers)
    sorted_defense = defenders.sort_by do |player|
      player.name
    end
    sorted_mids = midfielders.sort_by do |player|
      player.name
    end
    sorted_offense = forwards.sort_by do |player|
      player.name
    end
    defense = sorted_defense.map do |player|
      player.name
    end.join(", ")
    mids = sorted_mids.map do |player|
      player.name
    end.join(", ")
    offense = sorted_offense.map do |player|
      player.name
    end.join(", ")
    # sorted_mids = midfielders.sort
    # sorted_offense = forwards.sort


    puts "Defenders\n\t#{defense.each do |player| - player\n}\n\nForwards\n\t#{offense.each do |player| - player\n}Midfielders\n\t#{mids.each do |player| - player\n}"

  end
end
