require 'minitest'
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

  def test_team_starts_not_eliminated
    assert_equal false, @team.eliminated?
  end

  def test_team_can_be_eliminated
    @team.eliminated = true
    assert_equal true, @team.eliminated?
  end

  def test_players_starts_empty
    assert_equal [], @team.players
  end

  def test_it_can_add_players
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    assert_equal [@mbappe, @pogba], @team.players
  end

  def test_it_can_separate_players_by_position
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    assert_equal [@pogba], @team.players_by_position("midfielder")
    assert_equal [], @team.players_by_position("defender")
  end



end




# pry(main)> team.players_by_position("midfielder")
# # => [#<Player:0x00007fe0d0851138...>]
#
# pry(main)> team.players_by_position("defender")
# # => []
# ```
