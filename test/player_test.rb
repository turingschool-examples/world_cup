require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest < MiniTest::Test

  def test_player_exists
    player = Player.new("Paul Pogba", :midfielder)

    assert_instance_of Player, player
  end

  def test_player_has_name
    player = Player.new("Paul Pogba", :midfielder)
    expected = "Paul Pogba"
    actual = player.name

    assert_equal expected, actual
  end

end
