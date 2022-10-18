class Player
  attr_reader :name,
              :position

  def initialize(attribute)
    @name = attribute[:name]
    @position = attribute[:position]
  end
end