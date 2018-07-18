require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test

  def test_it_has_country
    france = Team.new('France')
    assert_equal 'France', france.country
  end  
 
  def test_it_has_roster
    france = Team.new('France')
    assert_equal [], france.players
  end
  
  def test_it_has_been_eliminated
    france = Team.new('France')
    assert_equal false, france.eliminated?
  end

  def test_it_can_be_eliminated
    france = Team.new('France')
    france.eliminated?
    assert_equal false, france.eliminated?
    france.eliminated
    assert_equal true, france.eliminated?
  end

  def test_add_player
    france = Team.new('France')
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    expected = [mbappe, griezmann, pogba]
    
    assert_equal expected, france.players 
  end


  def test_sort_by_position
    france = Team.new('France')
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
      
    expected = [pogba]
    assert_equal expected, france.player_by_position(:midfielder)
  end
end
