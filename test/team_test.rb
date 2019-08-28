require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require 'pry'

class TeamTest < Minitest::Test

  def setup
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  def test_it_exists
    assert_instance_of Team, @team
  end

  def test_name
    assert_equal "France", @team.country
  end

  def test_not_eliminiated_at_initialization
    assert_equal false, @team.eliminated?
  end

  def test_writing_eliminated
    @team.eliminated = true

    assert_equal true, @team.eliminated?
  end

  def test_starts_with_empty_players_array
    assert_equal [], @team.players
  end

  def test_add_players
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

    assert_equal [@mbappe, @pogba], @team.players
  end

  def test_players_by_position
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

    assert_equal [@pogba], @team.players_by_position("midfielder")
    assert_equal [], @team.players_by_position("defender")
  end

end
