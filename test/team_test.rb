# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/team'
require './lib/player'

class TeamTest < Minitest::Test
  def setup
    @france = Team.new('France')
  end

  def test_it_exists
    assert_instance_of Team, @france
  end

  def test_it_has_a_country_name
    expected = 'France'
    actual   = @france.country

    assert_equal expected, actual
  end

  def test_it_starts_with_no_players
    expected = []
    actual   = @france.players

    assert_equal expected, actual
  end

  def test_it_starts_not_elminated
    refute @france.eliminated?
  end

  def test_it_can_be_eliminated
    @france.eliminated = true

    assert @france.eliminated?
  end
end
