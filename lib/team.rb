class Team
  attr_reader :country
  attr_accessor :eliminated

  def initialize(country_parameter)
    @country = country_parameter
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end

end
