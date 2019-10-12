require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_it_initializes_with_readable_name_and_position
    assert_equal "Luka Modric", @player.name
    assert_equal "midfielder", @player.position
  end

end
