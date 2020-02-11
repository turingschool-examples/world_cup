class Player
  attr_reader :name, :position

  def initialize(player_data_parameter)
    @name = player_data_parameter[:name]
    @position = player_data_parameter[:position]
  end
end
