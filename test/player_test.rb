require'minitest/autorun'
require'minitest/pride'
require'./lib/player'
require'pry'

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
  end

  def test_it_exists
    # skip
  assert_instance_of Player, @player
  end

  def test_player_has_a_name
    # skip
    assert_equal "Luka Modric", @player.name
  end

  def test_player_has_a_position
    # skip
    assert_equal "midfielder", @player.position
  end

end
