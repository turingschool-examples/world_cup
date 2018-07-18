require 'minitest/pride'
require 'minitest/autorun'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_exists
    player = Player.new("Paul Pogba", :midfielder)
    assert_instance_of Player, player
  end

  def test_it_has_attributes
    pogba = Player.new("Paul Pogba", :midfielder)
    assert_equal "Paul Pogba", pogba.name
    assert_equal :midfielder, pogba.position
  end

end
