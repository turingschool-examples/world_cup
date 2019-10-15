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
    skip
    assert_instance_of Team, @team
  end

end
