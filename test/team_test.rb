# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/team'
require './lib/player'

class TeamTest < Minitest::Test
  def setup
    @france    = Team.new('France')
    @mbappe    = Player.new('Kylian Mbappe', :forward)
    @griezmann = Player.new('Antoine Griezmann', :forward)
    @pogba     = Player.new('Paul Pogba', :midfielder)
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

  def test_players_can_be_added_to_team
    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)

    expected = [@mbappe, @griezmann, @pogba]
    actual   = @france.players

    assert_equal expected, actual
  end

  def test_can_return_players_by_position
    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)

    expected = [@pogba]
    actual   = @france.players_by_position(:midfielder)

    assert_equal expected, actual

    expected2 = [@mbappe, @griezmann]
    actual2   = @france.players_by_position(:forward)

    assert_equal expected2, actual2
  end

  def test_it_returns_players_name_by_position
    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)

    expected = ['Antoine Griezmann', 'Kylian Mbappe']
    actual   = @france.name_by_position(:forward)

    assert_equal expected, actual
  end
end
