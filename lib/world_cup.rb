class WorldCup

  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    all_players = []
    @teams.each{|team| all_players << team.players_by_position(position)}
    all_players.flatten
  end

  def all_players_by_position
    positionhash = Hash.new([])
    @teams.each do |team|
      team.players.each do |player|
        positionhash[player.position] = positionhash[player.position]
      end
    end
    positionhash.each_key{|key| positionhash[key] = active_players_by_position(key)}
  end

end
