require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require './lib/world_class'

class WorldCupTest < Minitest::Test

  def test_it_exists
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_instance_of WorldCup, world_cup
  end


end
