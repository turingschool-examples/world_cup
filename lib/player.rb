class Player
  attr_reader :name, :position

  def initialize(player_params)
    @name = player_params[:name]
    @position = player_params[:position]
  end
end
