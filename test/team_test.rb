require 'minitest/pride'
require 'minitest/autorun'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test 
  
  def test_it_exists 
    player = Team.new("France")
    
    assert_instance_of Team, player
  end
  
  def test_it_has_attributes
    skip
    france = Team.new("France")
    player_1 = Player.new("Paul Pogba", :midfielder)
    
    assert_equal "France", france.country
    assert_equal [], france.players
    assert_equal "Paul Pogba", france.name
    assert_equal :midfielder, france.position
    assert_equal player_1, france.player
  end
  
  def test_it_adds_players
    france = Team.new("France")
    player_1 = Player.new("Kylian Mbappe", :forward)
    player_2 = Player.new("Paul Pogba", :midfielder)
    
    france.add_player(player_1)
    france.add_player(player_2)
    assert_equal [player_1, player_2], france.players
  end
  
  def test_it_returns_players_by_position
    france = Team.new("France")
    player_1 = Player.new("Kylian Mbappe", :forward)
    player_2 = Player.new("Paul Pogba", :midfielder)
    
    assert_equal player_1, france.players_by_position(:forward)
    assert_equal player_2, france.players_by_position(:midfielder)  
  end
  
  
  
end