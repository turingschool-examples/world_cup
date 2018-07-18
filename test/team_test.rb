require 'minitest/autorun'
require 'minitest/emoji'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test

  def setup
    @france = Team.new("France")
  end

  def test_it_exists
    assert_instance_of Team, @france
  end

  def test_it_has_country
    assert_equal "France", @france.country
  end

  def test_it_starts_with_no_players
    assert_equal [], @france.players
  end

  def test_it_starts_unelimintated
    refute @france.eliminated
  end

  def test_it_can_be_eliminated
    @france.eliminated = true
    assert @france.eliminated
  end

  def test_it_holds_players
    mbappe = Player.new("Kylian Mbappe", :forward)
    @france.add_player(mbappe)
    assert_instance_of Player, @france.players.first
  end

  def test_it_returns_players_by_position
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    @france.add_player(mbappe)
    @france.add_player(griezmann)
    @france.add_player(pogba)
    assert_equal [pogba], @france.players_by_position(:midfielder)
  end
end
