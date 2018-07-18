require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_has_player
    pogba = Player.new("Paul Pogba", :midfielder)

    assert_instance_of Player, pogba
  end

  def test_it_can_call_name
    pogba = Player.new("Paul Pogba", :midfielder)

    assert_equal "Paul Pogba", pogba.name
  end

  def test_it_can_call_position
    pogba = Player.new("Paul Pogba", :midfielder)

    assert_equal :midfielder, pogba.position
  end
end
