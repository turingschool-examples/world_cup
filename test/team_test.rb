require "minitest/autorun"
require "minitest/pride"
require "./lib/player.rb"
require "./lib/team.rb"
require "pry"

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

  def test_eliminated_false_by_default
    france = Team.new("France")
    assert_equal false, france.eliminated?
  end

  def test_eliminates_team
    france = Team.new("France")
    actual = france.eliminated
    assert_equal true, actual
    assert_equal true, france.eliminated?
  end

  def test_adds_player
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    assert_equal [mbappe], france.add_player(mbappe)
    assert_equal [mbappe, griezmann], france.add_player(griezmann)
    assert_equal [mbappe, griezmann, pogba], france.add_player(pogba)
  end

  def test_returns_players
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    assert_equal [mbappe, griezmann, pogba], france.players
  end

end
