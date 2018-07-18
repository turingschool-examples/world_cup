require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test


  def test_it_exists
    france = Team.new("France")

    assert_instance_of Team, france
  end

  def test_it_has_attributes
    france = Team.new("France")

    assert_equal "France", france.country
    assert_equal ([]), france.players
  end
end
