require 'minitest/autorun'
require 'minitest/pride'
require './lib/world_cup'

class WorldCupTest < Minitest::Test
  def setup
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})

    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)

    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_it_exists
    assert_instance_of WorldCup, @world_cup
  end

  def test_it_inits_with_year_and_teams
    assert_equal 2018, @world_cup.year
    assert_equal [@france, @croatia], @world_cup.teams
  end

  def test_active_players_by_position_returns_ary_of_non_eliminated_players_by_pos
    assert_equal [@pogba, @modric], @world_cup.active_players_by_position("midfielder")
  end

  def test_active_players_by_position_returns_ary_of_non_eliminated_players_by_pos_after_elim
    @croatia.eliminated = true

    assert_equal [@pogba], @world_cup.active_players_by_position("midfielder")
  end
end
