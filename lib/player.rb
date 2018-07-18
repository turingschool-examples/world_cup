require "pry"

class Player

  @@positions = []

  def self.positions
    @@positions.sort
  end

  attr_reader :name, :position
  def initialize(name, position)
    @name = name
    @position = position
    if @@positions.include?(position)
      position
    else
      @@positions << position
    end
  end
end
