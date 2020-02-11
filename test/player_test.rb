require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_can_exist
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_instance_of Player, player
  end
end
