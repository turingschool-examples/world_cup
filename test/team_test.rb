require 'minitest/autorun'
require 'minitest/pride'
require './lib/team'
require './lib/player'

class TeamTest < Minitest::Test
  def setup
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})  
  end 

  def test_it_exists
    assert_instance_of Team, @team
  end

  def test_it_has_country_attribute 
    assert_equal "France", @team.country
  end

  def test_eliminated_attribute_is_false_by_default
    assert_equal false, @team.eliminated
  end 

  def test_if_team_is_eliminated?
    assert_equal false, @team.eliminated?

    @team.eliminated = true 
    assert_equal true, @team.eliminated?
  end 

  def test_players_attribute_is_empty_array_by_default
    assert_equal [], @team.players
    assert_equal Array, @team.players.class
  end 

  def test_it_can_add_players
    @team.add_player(@mbappe)
    @team.add_player(@pogba) 

    assert_equal [@mbappe, @pogba], @team.players
  end 

  def test_it_can_idenity_players_by_position 
    @team.add_player(@mbappe)
    @team.add_player(@pogba) 
    
    assert_equal [@pogba], @team.players_by_position("midfielder")
    assert_equal [], @team.players_by_position("defender")
  end 
end 