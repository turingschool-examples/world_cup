require "pry"
require "minitest/autorun"
require "minitest/pride"
require "./lib/team"
require "./lib/player"

class TeamTest < Minitest::Test

  def test_if_it_exists
    france = Team.new("France")

    assert_instance_of Team, france
  end

  def test_the_country_name
    france = Team.new("France")

    assert_equal "France", france.country
  end

  def test_if_player_array_is_empty
    france = Team.new("France")

    assert_equal [], france.players
  end

  def test_if_team_is_eliminated
    france = Team.new("France")

    assert_equal false, france.eliminated?
  end

  def test_if_team_is_eliminated_equals_true
    france = Team.new("France")

    assert_equal true, france.eliminated
  end

  def test_if_team_is_eliminated_equals_true_again
    skip
    france = Team.new("France")

    assert_equal true, france.eliminated?
  end

  def test_if_it_adds_new_player
    france = Team.new("France")

    pogba = Player.new("Paul Pogba", :midfielder)
    mbappe = Player.new("Kylian Mbappe", :forward)

    assert_instance_of Player, mbappe
  end

  def test_if_it_adds_new_second_player

    france = Team.new("France")

    pogba = Player.new("Paul Pogba", :midfielder)
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)

    assert_instance_of Player, griezmann
  end

  def test_if_it_adds_player_to_array
    france = Team.new("France")

    pogba = Player.new("Paul Pogba", :midfielder)
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)

    france.add_player(mbappe)

    assert_equal [mbappe], france.players
  end

  def test_if_it_adds_second_player_to_array

    france = Team.new("France")

    pogba = Player.new("Paul Pogba", :midfielder)
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)

    france.add_player(mbappe)
    france.add_player(griezmann)

    assert_equal [mbappe, griezmann], france.players
  end

  def test_if_it_adds_third_player_to_array

    france = Team.new("France")

    pogba = Player.new("Paul Pogba", :midfielder)
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    assert_equal [mbappe, griezmann, pogba], france.players
  end

  def test_player_by_position
    skip
    france = Team.new("France")

    pogba = Player.new("Paul Pogba", :midfielder)
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)

    france.players_by_position(:midfielder)

    assert_equal [pogba], france.player_position
  end

  def test_second_player_by_position

    france = Team.new("France")

    pogba = Player.new("Paul Pogba", :midfielder)
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)

    france.players_by_position(:midfielder)
    france.players_by_position(:forward)

    assert_equal [pogba, mbappe], france.player_position
  end



end
