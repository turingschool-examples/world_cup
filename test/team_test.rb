require 'minitest/autorun'
require 'minitest/pride'
require './lib/team'
require './lib/player'

class TeamTest < Minitest::Test

  def test_it_exists
    team = Team.new("France")

    assert_instance_of Team, team
  end

  def test_a_team_starts_with_no_player
    team = Team.new("France")

    assert_equal [], team.players
  end

  def test_a_team_starts_as_active
    # skip
    team = Team.new("France")

    assert_equal false, team.eliminated?
  end

  def test_a_team_can_be_eliminated
    # skip
    team = Team.new("France")

    team.eliminate_team

    assert_equal true, team.eliminated?
  end

  def test_a_team_can_add_players
    team = Team.new("France")
    player_1 = Player.new("Kylian Mbappe", :forward)
    player_2 = Player.new("Antoine Griezmann", :forward)
    player_3 = Player.new("Paul Pogba", :midfielder)

    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)

    assert_equal [player_1, player_2, player_3], team.players
  end

  def test_it_can_find_player_by_position
    team = Team.new("France")
    player_1 = Player.new("Kylian Mbappe", :forward)
    player_2 = Player.new("Antoine Griezmann", :forward)
    player_3 = Player.new("Paul Pogba", :midfielder)

    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)

    assert_equal [player_3], team.players_by_position(:midfielder)
  end

  def test_it_can_player_by_a_different_position
    team = Team.new("France")
    player_1 = Player.new("Kylian Mbappe", :forward)
    player_2 = Player.new("Antoine Griezmann", :forward)
    player_3 = Player.new("Paul Pogba", :midfielder)

    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)

    assert_equal [player_1, player_2], team.players_by_position(:forward)
  end


end
