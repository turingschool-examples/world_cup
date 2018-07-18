require './lib/team'
require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class TeamTest < Minitest::Test

  def setup
    @france = Team.new("France")
    @mbappe = Player.new("Kylian Mbappe", :forward)
    @griezmann = Player.new("Antoine Griezmann", :forward)
    @pogba = Player.new("Paul Pogba", :midfielder)
  end

  def test_it_exists
    assert_instance_of Team, @france
  end

  def test_it_has_a_country
    assert_equal "France", @france.country
  end

  def test_it_can_store_players
    assert_equal [], @france.players
  end

  def test_eliminated_is_false_by_default
    refute @france.eliminated?
  end

  def test_eliminated_can_be_changed_to_true
    @france.eliminated = true
    assert @france.eliminated?
  end

  def test_it_can_add_one_player
    @france.add_player(@mbappe)
    assert_equal [@mbappe], @france.players
  end

  def test_it_can_add_multiple_players
    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)
    assert_equal [@mbappe, @griezmann, @pogba], @france.players
  end

  def test_it_can_return_players_sorted_by_position
    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)
    assert_equal [@pogba], @france.players_by_position(:midfielder)
    assert_equal [@mbappe, @griezmann], @france.players_by_position(:forward)
  end
end
