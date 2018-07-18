require 'minitest/autorun'
require 'minitest/pride'
require './lib/team.rb'
require './lib/player.rb'

class TeamTest < Minitest::Test

  def test_it_exist
    france = Team.new("France")

    assert_instance_of Team, france
  end

  def test_it_has_empty_team
    france = Team.new("France")

    assert_equal [], france.players
  end

  def test_it_is_not_eliminated
    france = Team.new("France")

    assert_equal false, france.eliminated?
  end

  def test_team_can_add_players
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)

    assert_equal [mbappe], france.add_player(mbappe)
  end

  def test_it_can_show_players
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    assert_equal [mbappe, griezmann, pogba], france.players
  end

  def test_it_can_show_players_by_position
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    assert_equal [pogba], france.players_by_position(:midfielder)
  end




end
