class Team
  attr_reader :country, :players
  attr_accessor :eliminated

  def initialize(country_parameter)
    @country = country_parameter
    @eliminated = false
    @players = []
  end

  def eliminated?
    @eliminated
  end

end
