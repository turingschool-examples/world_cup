class Team
  attr_reader :eliminated

  def initialize(team, eliminated = false)
    @team = team
    @eliminated = eliminated
  end

  def country
    @team
  end

  def eliminated?
    @eliminated
  end

  def eliminated
    @team.eliminated = true
  end

end
