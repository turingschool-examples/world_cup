require "pry"

class Team
  attr_reader :country, :players, :eliminated
  def initialize(country)
    @country = country
    @players = []
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end

  def eliminated
    @eliminated = true
  end
end
