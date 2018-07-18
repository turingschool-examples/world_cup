require "./lib/player.rb"
require "minitest/autorun"
require "minitest/pride"

class PlayerTest < Minitest::Test

  def test_player_has_attributes
    pogba = Player.new("Paul Pogba", :midfielder)

    assert_equal "Paul Pogba", pogba.name
    assert_equal :midfielder, pogba.position
  end

end
