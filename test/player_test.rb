require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest < MiniTest::Test

  def test_it_exists
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_instance_of Player, player
  end 

  def test_has_attributes
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_equal "Luka Modric", player.name
    assert_equal "midfielder", player. position
  end
end
