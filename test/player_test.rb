require "./lib/player"
require "minitest/autorun"
require "minitest/pride"

class Player_Test < Minitest::Test
  def test_it_exists
    pogba = Player.new("Paul Pogba", :midfielder)
    assert_instance_of Player, pogba
  end
end
