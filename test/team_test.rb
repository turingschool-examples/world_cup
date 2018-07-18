require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test


  def test_it_exists
    france = Team.new("France")

    assert_instance_of Team, france
  end

  def test_it_has_attributes
    france = Team.new("France")

    assert_equal "France", france.country
    assert_equal ([]), france.players
  end

  def test_it_is_not_eliminated_by_default
    france = Team.new("France")

    assert_equal false, france.eliminated?
  end

  def test_it_can_be_eliminated
    france = Team.new("France")

    france.eliminated

    assert_equal true, france.eliminated?
  end

  def test_it_can_add_a_player
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    france.add_player(mbappe)

    assert_equal [mbappe], france.players
  end
end
