require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test

  def test_it_can_exist
    team = Team.new("France")

    assert_instance_of Team, team
  end

  def test_it_can_have_a_country
    team = Team.new("France")

    assert_equal "France", team.country
  end

  def test_it_starts_as_not_eliminated
    team = Team.new("France")

    assert_equal false, team.eliminated?
  end

  def test_it_can_be_eliminated
    team = Team.new("France")
    team.eliminated = true

    assert_equal true, team.eliminated?
  end

  def test_it_starts_with_no_players
    team = Team.new("France")

    assert_equal [], team.players
  end
end
