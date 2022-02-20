class Player
  attr_reader :name, :position
  def initialize(*data)
    @name = data[0].values[0]
    @position = data[0].values[1]
  end
end
