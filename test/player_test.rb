require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_has_attributes    
    pogba = Player.new("Paul Pogba", :midfielder)
    assert_equal "Paul Pogba", pogba.name 
    assert_equal :midfielder, pogba.position
  end
#
  def test_new_players
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    assert_instance_of Player, Player.new("Kylian Mbappe", :forward)
  end
end