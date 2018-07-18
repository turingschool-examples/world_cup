require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test

  def test_it_exists
    france = Team.new("France")

    assert_instance_of Team, france
  end

  def test_it_has_country
    france = Team.new("France")

    assert_equal "France", france.country
  end

  def test_it_starts_with_zero_players
    france = Team.new("France")

    assert_equal [], france.players
  end

  def test_it_begins_not_eliminated
    france = Team.new("France")

    refute false, france.eliminated
  end

  def test_it_can_be_eliminated
    skip
    france = Team.new("France")
    france.eliminated = true
    refute true, france.eliminated
  end

  def test_it_can_hold_players
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    france.add_player(mbappe)

    assert_instance_of Player, france.players.first
  end
  def test_it_can_sort_by_position
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    assert_equal [mbappe], france.players_by_position(:forward)
  end
end
