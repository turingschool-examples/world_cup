require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './team/player'

class TeamTest < Minitest::Test


  def test_it_exists
    france = Team.new("France")

    assert_instance_of Team, france 
  end
end
