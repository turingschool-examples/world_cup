class Team
  attr_reader :country, :players
  attr_accessor :eliminated


  def initialize(country)
    @country = country
    @players = []
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end


end
