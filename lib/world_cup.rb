class WorldCup
  attr_reader :year, :teams
  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    @teams.map do |team|
      if team.eliminated? == false
        team.players.find_all do |player|
          player.position == position
        end
      else
        []
      end
    end.flatten
  end

  # def all_players(boolean)
  #   # string = ""
  #   # player_hash = create_all_players_hash
  #   # player_hash.each do |k, v|
  #   #   string += k.capitalize + 's\nt- '
  #   #   string +=
  #
  # end
  #
  # def create_all_players_array
  #   @teams.map do |team|
  #     team.players
  #   end.flatten
  # end
  #
  # def create_all_players_hash
  #   hash = {}
  #   players = create_all_players_array
  #   players.each do |player|
  #     if hash.has_key? player.position
  #        hash[player.position] << [player.name]
  #      else
  #        hash[player.position] = []
  #        hash[player.position] << [player.name]
  #      end
  #   end
  #   hash
  # end
  #
  # def create_sorted_player_hash
  #   hash = create_all_players_hash
  #   hash.each do |k, v|
  #     v = v.sort_by do |name|
  #       name
  #     end
  #   end
  #   hash
  # end

end
