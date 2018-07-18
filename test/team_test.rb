require './lib/player'
require './lib/team'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class TeamTest < Minitest::Test

  def test_it_exists
    france = Team.new("France")
    assert_instance_of Team, france
  end

  def test_it_belongs_to_a_country
    france = Team.new("France")
    assert_equal "France", france.country
  end

  def test_it_starts_with_no_players_in_array
    france = Team.new("France")
    assert_equal [], france.players
  end

  def test_at_start_it_has_not_been_eliminated
    france = Team.new("France")
    assert_equal false, france.eliminated?
  end

  def test_it_can_be_eliminated
    france = Team.new("France")
    france.eliminated = true
    assert_equal true, france.eliminated?
  end

  def test_it_can_add_players
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    assert_equal [mbappe, griezmann, pogba], france.players
  end

  def test_it_can_return_players_by_position
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    expected = [pogba]
    actual = france.players_by_position(:midfielder)
    assert_equal expected, actual

    expected = [mbappe, griezmann]
    actual = france.players_by_position(:forward)
    assert_equal expected, actual
  end

end
