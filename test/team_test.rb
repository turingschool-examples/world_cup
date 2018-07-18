require 'minitest/pride'
require 'minitest/autorun'
require './lib/team'
require './lib/player'

class TeamTest < Minitest::Test

  def test_it_exists
    team = Team.new("France")

    assert_instance_of Team, team
  end

  def test_it_has_a_country
    team = Team.new("France")

    assert_equal "France", team.country
  end

  def test_it_starts_with_empty_array_of_players
    team = Team.new("France")

    assert_equal [], team.players
  end

  def test_it_does_not_start_eliminated
    team = Team.new("France")

    refute team.eliminated?
  end

  def test_it_can_be_eliminated
    team = Team.new("France")
    team.eliminated = true

    assert team.eliminated?
  end

  def test_players_can_be_added_to_team
    france = Team.new("France")

    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    assert_equal [mbappe, griezmann, pogba], france.players
  end

  def test_we_can_return_players_by_position
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
