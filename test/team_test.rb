require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test

  def setup
    @mbappe = Player.new("Kylian Mbappe", :forward)
    @griezmann = Player.new("Antoine Griezmann", :forward)
    @pogba = Player.new("Paul Pogba", :midfielder)
    @france = Team.new("France")
  end

  def test_it_exists
    france = Team.new("France")

    assert_instance_of Team, france
  end

  def test_it_has_a_country
    france = Team.new("France")

    assert_equal "France", france.country
  end

  def test_it_starts_with_no_players
    france = Team.new("France")

    assert_equal [], france.players
  end

  def test_it_starts_off_not_eliminated
    france = Team.new("France")

    refute france.eliminated?
  end

  def test_it_can_get_eliminated
    france = Team.new("France")

    france.eliminated

    assert france.eliminated?
  end

  def test_can_add_players
    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)

    actual = @france.players
    expected = [@mbappe, @griezmann, @pogba]

    assert_equal expected, actual
  end

  def test_can_search_player_by_position
    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)
    actual = @france.players_by_position(:midfielder)

    expected = [@pogba]

    assert_equal expected, actual

    expected = [@mbappe, @griezmann]
    actual = @france.players_by_position(:forward)

    assert_equal expected, actual 
  end
end
