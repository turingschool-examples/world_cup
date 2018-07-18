require 'minitest/pride'
require 'minitest/autorun'
require './lib/player'
require './lib/team'
require './lib/world_cup'

class WorldCupTest < Minitest::Test 
  
  def test_it_exists 
    world_cup = WorldCup.new(2018, [france, croatia])
    
    assert_instance_of WorldCup, world_cup
  end
  
  
  
  