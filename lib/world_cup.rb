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





end
