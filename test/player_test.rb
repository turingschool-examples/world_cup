require'minitest/autorun'
require'minitest/pride'
require'./lib/player'
require'pry'

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
  end

  def test_it_exists
  assert_instance_of Player, @player
  end
