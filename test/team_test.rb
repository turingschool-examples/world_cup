require "minitest/autorun"
require "minitest/pride"
require "./lib/player.rb"
require "./lib/team.rb"
require "pry"

class TeamTest < Minitest::Test
  def test_it_exists
    france = Team.new("France")
    assert_instance_of Team, france
  end

  def test_it_has_attributes
    france = Team.new("France")
    assert_equal "France", france.country
    assert_equal [], france.players
  end

  def test_eliminated_false_by_default
    france = Team.new("France")
    assert_equal false, france.eliminated?
  end

end
