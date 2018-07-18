require './lib/player'
require './lib/team'
require 'minitest/autorun'
require 'minitest/pride'

class TeamTest < MiniTest::Test

  def test_team_exists
    france = Team.new("France")

    assert_instance_of Team, france
  end

  def test_it_has_a_country
    france = Team.new("France")
    expected = "France"
    actual = france.country

    assert_equal expected, actual
  end

  def test_france_starts_with_empty_team
    france = Team.new("France")
    expected = []
    actual = france.players
    assert_equal expected, actual
  end

  def test_france_starts_not_eliminated
    france = Team.new("France")
    expected = false
    actual = france.eliminated?
    assert_equal expected, actual
  end

  def test_france_becomes_eliminated
    france = Team.new("France")
    expected = true
    actual = france.eliminated
    assert_equal expected, actual
  end

  def test_can_add_players
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    assert_equal [mbappe, griezmann, pogba], france.players
  end

  def test_can_organize_player_by_position
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    expected_1 = [pogba]
    actual_1 = france.players_by_position(:midfielder)
    expected_2 = [mbappe, griezmann]
    actual_2 =
    france.players_by_position(:forward)
    assert_equal expected_1, actual_1
    assert_equal expected_2, actual_2
  end





end
