require 'minitest/pride'
require 'minitest/autorun'
require './lib/player.rb'

class PlayerTest < Minitest::Test

  def test_it_exist
    pogba = Player.new("Paul Pogba", :midfielder)

    assert_instance_of Player, pogba
  end

  def test_it
    pogba = Player.new("Paul Pogba", :midfielder)

    assert_equal :midfielder , pogba.position
    assert_equal "Paul Pogba", pogba.name
  end
end
