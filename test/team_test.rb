require 'minitest/autorun'
require 'minitest/emoji'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test

  def test_it_exists
    france = Team.new("France")

    assert_instance_of Team, france
  end

  def test_it_has_a_country
    france = Team.new("France")

    assert_equal "France", france.country
  end

  def test_it_team_starts_with_zero_players
    france = Team.new("France")

    assert_equal [], france.players
  end

  def test_it_teams_start_not_eliminated
    france = Team.new("France")

    assert_equal false, france.eliminated?
  end

  def test_team_can_be_eliminated
    france = Team.new("France")

    france.eliminated = true
    assert_equal true, france.eliminated?
  end

  def test_team_can_add_players
    france = Team.new("France")

    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    assert_equal [mbappe, griezmann, pogba], france.players
  end

  def test_it_can_list_players_by_postion
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
