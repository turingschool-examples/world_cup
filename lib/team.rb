require './lib/player'

class Team
  attr_reader :country
  attr_accessor :eliminated

  def initialize(country)
    @country = country
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end
end
