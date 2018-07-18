require "minitest/autorun"
require "minitest/pride"
require './lib/world_cup'

class WorldCupTest < Minitest::Test
  def setup
    @france = Team.new("France")
    @mbappe = Player.new("Kylian Mbappe", :forward)
    @griezmann = Player.new("Antoine Griezmann", :forward)
    @pogba = Player.new("Paul Pogba", :midfielder)
    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)

    @croatia = Team.new("Croatia")
    @modric = Player.new("Luka Modric", :midfielder)
    @perisic = Player.new("Ivan Perisic", :forward)
    @vida = Player.new("Domagoj Vida", :defender)
    @croatia.add_player(@modric)
    @croatia.add_player(@perisic)
    @croatia.add_player(@vida)

    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_it_exists
    assert_instance_of WorldCup, @world_cup
  end

  def test_it_has_attributes
    assert_equal 2018,@world_cup.year
    assert_equal [@france,@croatia], @world_cup.teams
  end

  def test_it_return_active_players_by_positions
    expected = [@pogba,@modric]
    actual = @world_cup.active_players_by_position(:midfielder)

    assert_equal expected, actual

    @croatia.eliminated = true

    expected_2 = [@pogba]
    actual_2 = @world_cup.active_players_by_position(:midfielder)

    assert_equal expected_2, actual_2
  end

  def test_it_prints_all_players
    assert_equal "Defenders\n\t- Domagoj Vida\n\nForwards\n\t- Antoine Griezmann\n\t- Ivan Perisic\n\t- Kylian Mbappe\n\nMidfielders\n\t- Luka Modric\n\t- Paul Pogba\n\n", @world_cup.all_players
    @croatia.eliminated = true
    assert_equal "Forwards\n\t- Antoine Griezmann\n\t- Kylian Mbappe\n\nMidfielders\n\t- Paul Pogba\n\n", @world_cup.all_players(true)
  end
end
