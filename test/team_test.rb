require'minitest/autorun'
require'minitest/pride'
require'./lib/player'
require'./lib/team'
require'pry'

class TeamTest < Minitest::Test

  def setup
    @team = Team.new("France")
  end

  def test_it_exists
    # skip
    assert_instance_of Team, @team
  end

  def test_it_has_a_country
    skip
    assert_equal "France", @team.country
  end

  def test_it_is_elimniated
    skip
    assert_equal false, @team.eliminated?
    team.eliminated = true
    assert_equal true, @team.eliminated?
  end

end
