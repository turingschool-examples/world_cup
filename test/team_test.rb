require "minitest/autorun"
require "minitest/pride"
require './lib/team'

class TeamTest < Minitest::Test

  def test_it_exists
    france = Team.new("France")
    assert_instance_of Team, france
  end

  def test_it_has_attributes
    france = Team.new("France")
    assert_equal "France", france.country
    assert_equal [], france.players
    assert_equal false, france.eliminated?
  end

  def test_elimination_status_changes
    france = Team.new("France")
    france.eliminated = true
    assert_equal true, france.eliminated?
  end

  def test_it_adds_players
    pogba = Player.new("Paul Pogba", :midfielder)
    france = Team.new("France")
    france.add_player(pogba)
    assert_instance_of Player, france.players[0]
    assert_equal 1, france.players.count
  end

  def test_it_returns_all_players_of_one_position
    pogba = Player.new("Paul Pogba", :midfielder)
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)

    france = Team.new("France")

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    expected = [mbappe,griezmann]
    actual = france.players_by_position(:forward)

    assert_equal expected, actual
  end
end
