require './lib/team.rb'
require './lib/player.rb'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class TeamTest < Minitest::Test

  def test_it_exists
    france = Team.new("France")
    assert_instance_of Team, france
  end

  def test_it_has_country
    france = Team.new("France")
    assert_equal "France", france.country
  end

  def test_it_starts_with_no_players
    france = Team.new("France")
    assert_equal [], france.players
  end

  def test_it_starts_with_false_eliminated_status
    france = Team.new("France")
    refute france.eliminated?
  end

  def test_it_can_check_eliminated_status
    france = Team.new("France")
    assert france.eliminated = true
  end

  def test_it_can_change_eliminated_status
    france = Team.new("France")
    france.eliminated = true
    assert france.eliminated?
  end

  def test_it_can_add_players_to_team
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    assert_equal [mbappe, griezmann, pogba], france.players
  end

  def test_it_can_find_players_by_position
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
