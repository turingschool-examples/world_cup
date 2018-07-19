require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require 'pry'

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
  
  def test_elimination_query_is_false_by_default
    france = Team.new("France")
    
    assert_equal false, france.eliminated?
  end
  
  def test_eliminated_changes_elimination_query_to_true
    france = Team.new("France") 
    
    assert_equal true, france.eliminated
  end 
  
  def test_it_adds_players
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
     
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    assert_equal [mbappe, griezmann, pogba], france.players
  end 
  
  def test_it_returns_players_by_position 
    france = Team.new("France") 
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
     
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    
    assert_equal [pogba], france.players_by_position(:midfielder)
    assert_equal [mbappe, griezmann], france.players_by_position(:forward)
  end 
    
end 



