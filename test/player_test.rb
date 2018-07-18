require "minitest/autorun"
require "minitest/pride"
require "./lib/player.rb"
require "pry"

class PlayerTest < Minitest::Test
  def test_it_exists
    pogba = Player.new("Paul Pogba", :midfielder)
    assert_instance_of Player, pogba
  end

  def test_it_has_attributes

  end
end
