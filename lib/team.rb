class Team
  attr_reader :country
  attr_accessor :eliminated, :players

  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end

  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    @players.find_all do |player|
      player.position.include? position
    end

  end

end
