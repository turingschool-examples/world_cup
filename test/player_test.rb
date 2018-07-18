require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PlayerTest < Minitest::Test

  def test_it_exists
    pogba = Player.new("Paul Pogba", :midfielder)
    assert_instance_of Player, pogba
  end

  def test_it_has_a_name
    pogba = Player.new("Paul Pogba", :midfielder)
    assert_equal "Paul Pogba", pogba.name
  end

  def test_it_has_a_position
    pogba = Player.new("Paul Pogba", :midfielder)
    assert_equal :midfielder, pogba.position
  end


end
