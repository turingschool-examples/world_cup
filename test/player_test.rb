require "minitest/autorun"
require "minitest/pride"
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @pogba = Player.new("Paul Pogba", :midfielder)
  end

  def test_it_exists
    assert_instance_of Player, @pogba
  end

  def test_player_has_attributes
    assert_equal "Paul Pogba", @pogba.name
    assert_equal :midfielder, @pogba.position
  end
end
