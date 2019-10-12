require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test

  def setup
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  def test_it_exists
    assert_instance_of Team, @team
  end

  def test_it_starts_not_eliminated
    assert_equal false, @team.eliminated?
  end

  def test_it_can_be_made_eliminated
    @team.eliminated = true
    assert_equal true, @team.eliminated?
  end

  def test_it_starts_with_no_players
    assert_equal [], @team.players
  end

  def test_it_can_add_player
    @team.add_player(@mbappe)
    assert_equal [@mbappe], @team.players
    @team.add_player(@pogba)
    assert_equal [@mbappe, @pogba], @team.players
  end

  def test_it_can_return_array_of_players_by_position
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    assert_equal [@pogba], @team.players_by_position("midfielder")
    assert_equal [], @team.players_by_position("defender")
  end
end
