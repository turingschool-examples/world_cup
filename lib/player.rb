require './lib/cup'

class Player 
  
  include Cup
  
  def initialize(name, position)
    @name = name
    @position = position
  end
  
end