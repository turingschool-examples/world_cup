# frozen_string_literal: true

# Team class
class Team
  attr_reader :country,
              :players
  attr_writer :eliminated

  def initialize(country)
    @country = country
    @players = []
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end
end
