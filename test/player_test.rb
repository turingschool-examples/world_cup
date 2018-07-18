require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest < MiniTest::Test
  def test_it_exists
    player = Player.new("Paul Pogba", :midfielder)

    assert_instance_of Player, player
  end
  def test_it_has_a_name
    player = Player.new("Paul Pogba", :midfielder)

    assert_equal "Paul Pogba", player.name
  end
  def test_it_has_a_position
    player = Player.new("Paul Pogba", :midfielder)

    assert_equal :midfielder, player.position
  end
end
