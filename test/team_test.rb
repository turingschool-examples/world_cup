require 'minitest/autorun'
require 'minitest/pride'
require './lib/team'
require './lib/player'

class TeamTest < Minitest::Test
  def test_it_exists_and_has_attributes
    team = Team.new("France")

    assert_instance_of Team, team
  end

  def test_not_eliminated_when_created
    team = Team.new("France")

    assert_equal false, team.eliminated?
  end

  def test_eliminated
    team = Team.new("France")
    team.eliminated

    assert_equal true, team.eliminated?
  end

  def test_add_player
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.add_player(mbappe)
    team.add_player(pogba)
    expected = [mbappe, pogba]

    assert_equal expected, team.players
  end

  def test_players_by_position
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.add_player(mbappe)
    team.add_player(pogba)

    assert_equal [pogba], team.players_by_position("midfielder")
    assert_equal [], team.players_by_position("defender")
  end

end
