class Team
  attr_reader :country, :eliminated

  def initialize(country_parameter)
    @country = country_parameter
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end

end
