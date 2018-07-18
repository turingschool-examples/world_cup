# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/emoji'
require './lib/team'
require './lib/player'
require './lib/world_cup'

class WorldCupTest < Minitest::Test
  def setup
    @france    = Team.new('France')
    @mbappe    = Player.new('Kylian Mbappe', :forward)
    @griezmann = Player.new('Antoine Griezmann', :forward)
    @pogba     = Player.new('Paul Pogba', :midfielder)

    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)

    @croatia = Team.new('Croatia')
    @modric  = Player.new('Luka Modric', :midfielder)
    @perisic = Player.new('Ivan Perisic', :forward)
    @vida    = Player.new('Domagoj Vida', :defender)

    @croatia.add_player(@modric)
    @croatia.add_player(@perisic)
    @croatia.add_player(@vida)

    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_it_exists
    assert_instance_of WorldCup, @world_cup
  end

  def test_it_has_a_year
    expected = 2018
    actual   = @world_cup.year

    assert_equal expected, actual
  end

  def test_it_has_teams
    expected = [@france, @croatia]
    actual   = @world_cup.teams

    assert_equal expected, actual
  end

  def test_it_can_list_active_players_by_position
    expected = [@mbappe, @griezmann, @perisic]
    actual   = @world_cup.active_players_by_position(:forward)

    assert_equal expected, actual
  end
end
