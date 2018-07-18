# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new('Paul Pogba', :midfielder)
  end

  def test_it_exists
    assert_instance_of Player, @player
  end
end
