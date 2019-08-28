class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    @teams.map {|team|
      if !team.eliminated?
        team.players_by_position(position)
      end
    }.flatten.compact
  end
  
  # def all_players_by_position
  #   all_players_by_position_hash = Hash.new([])
  #
  #   all_positions.each do |position|
  #     all_players_by_position_hash[position]
  #   end
  #
  #   all_players.each do |player|
  #     all_players_by_position_hash[player.position] << player
  #   end
  #
  #   all_players_by_position_hash
  # end

  def all_players_by_position
    all_players_by_position_hash = Hash.new([])

    all_positions.each do |position|
      all_players_by_position_hash[position] = active_players_by_position(position)
    end

    all_players_by_position_hash
  end


  def all_players
    @teams.map {|team| team.players}.flatten
  end

  def all_positions
    all_players.map do |player|
      player.position
    end.flatten
  end
end
