class Player
  attr_reader :player, :name, :position

  def initialize(player)
    @player = player
  end

  def name
    player[:name]
  end

  def position
    player[:position]
  end

end
