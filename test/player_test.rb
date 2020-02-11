require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_can_exist
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_instance_of Player, player
  end

  def test_it_has_a_name
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_equal "Luka Modric", player.name
  end

  def test_it_has_a_position
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_equal "midfielder", player.position
  end
end
