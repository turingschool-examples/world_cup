require 'minitest/autorun'
require 'minitest/pride'
require '../lib/player'
require '../lib/team'
class TeamTest < Minitest::Test
  def setup
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  def test_it_exists
    assert_instance_of Team, @team
  end

  def def_test_it_has_a_country_and_is_not_eliminated
    assert_equal "France", @team.country
    refute @team.eliminated?
  end

  def test_it_can_be_eliminated_through_attr_writer
    @team.eliminated = true

    assert @team.eliminated?
  end

  def test_it_starts_with_no_players
    assert_equal [], @team.players
  end

  def test_it_can_hold_multiple_players
    @team.add_player(@mgappe)
    @team.add_player(@pogba)

    assert_equal [@mgappe, @pogba], @team.players
  end

  def test_it_can_sort_players_by_position
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

    assert_equal [@pogba], @team.players_by_position("midfielder")
    assert_equal [], @team.players_by_position("defender")
  end
end
