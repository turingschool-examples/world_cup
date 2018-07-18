
module Cup 
  
  def position
    @position
  end
  
  def name 
    @name 
  end
  
  def elimintaed?
  @eliminated = false
  end
  
  def player
    @player = Player.new(@name, @position)
  end
  

  
end