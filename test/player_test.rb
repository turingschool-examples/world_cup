require 'minitest/autorun'
require 'minitest/pride'
require '../lib/player'


class PlayerTest < Minitest::Test

  def test_it_exists_and_has_attributes
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_instance_of Player, player
    assert_equal "Luka Modric", player.name
    assert_equal "midfielder", player.position
  end
end
