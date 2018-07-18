require "./lib/player"
require "./lib/team"
require "minitest/autorun"
require "minitest/pride"

class TeamTest < Minitest::Test
  def test_it_exists
    france = Team.new("France")
    assert_instance_of Team, france
  end

  def test_it_has_a_country
    france = Team.new("France")
    assert_equal "France", france.country
  end
end
