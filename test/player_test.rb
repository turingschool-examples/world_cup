# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new('Paul Pogba', :midfielder)
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_it_has_attributes
    expected = 'Paul Pogba'
    actual   = @player.name

    assert_equal expected, actual

    expected2 = :midfielder
    actual2   = @player.position

    assert_equal expected2, actual2
  end
end
