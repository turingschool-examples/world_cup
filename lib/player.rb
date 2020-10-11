class Player
  attr_reader :info

  def initialize(info)
    @info = info
  end

  def name
    @info[:name]
  end

  def position
    @info[:position]
  end


end
