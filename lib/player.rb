# frozen_string_literal: true

# Player class
class Player
  attr_reader :name,
              :position

  def initialize(name, position)
    @name = name
    @position = position
  end
end
