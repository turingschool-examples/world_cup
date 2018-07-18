class WorldCup

  attr_reader   :year,
                :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
    @active_teams = []
  end

  def find_active_teams
    @teams.find_all do |team|
      team.eliminated? == false
    end
  end

  def active_players_by_position(position)
    find_active_teams.map do |team|
      team.players.find_all do |player|
        player.position == position
      end
    end.flatten
  end

  def position_names
    positions = []
    find_active_teams.map do |team|
      team.players.find_all do |player|
        pos = player.position.to_s.capitalize
        positions << "#{pos}s"
      end
    end
    positions.uniq.sort
  end
  # 
  # def all_players(standing = false)
  #   find_active_teams.map do |team|
  #     team.players.find_all do |player|
  #       player.position
  #
  # end
end
