require './lib/team'
require './lib/player'
require './lib/world_cup'
require 'minitest/autorun'
require 'minitest/pride'

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

  def test_it_has_a_year
    assert_equal 2018, @world_cup.year
  end

  def test_it_can_return_teams
    assert_equal [@france, @croatia], @world_cup.teams
  end

  def test_it_can_return_active_players_by_position
    @croatia.eliminated = true
    assert_equal [@mbappe, @griezmann], @world_cup.active_players_by_position(:forward)
  end

  def test_it_can_return_all_players
    expected = "Defenders\n\t- Domagoj Vida\n\nForwards\n\t- Antoine Griezmann\n\t- Ivan Perisic\n\t- Kylian Mbappe\n\nMidfielders\n\t- Luka Modric\n\t- Paul Pogba"
    assert_equal expected, @world_cup.all_players
  end
end
