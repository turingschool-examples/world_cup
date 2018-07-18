require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PlayerTest < Minitest::Test

  def test_existence
    pl = Player.new("Paul Pogba", :midfielder)
    assert_instance_of Player, pl
  end

  def test_attributes
    pl = Player.new("Paul Pogba", :midfielder)
    result = pl.name
    expected = "Paul Pogba"
    assert_equal expected, result
    result = pl.position
    expected = :midfielder
    assert_equal expected, result
  end



end
