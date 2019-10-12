require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require './lib/world_cup'

class WorldCupTest < Minitest::Test

  def setup
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)

    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)

    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_it_exists
    assert_instance_of WorldCup, @world_cup
  end

  def test_it_starts_with_readable_year_and_teams
    assert_equal 2018, @world_cup.year
    assert_equal [@france, @croatia], @world_cup.teams
  end

  def test_it_can_return_array_of_active_players_by_position
    assert_equal [@pogba, @modric], @world_cup.active_players_by_position("midfielder")
  end

  def test_it_does_not_report_eliminated_teams_players_as_active
    @croatia.eliminated = true
    assert_equal [@pogba], @world_cup.active_players_by_position("midfielder")
    @france.eliminated = true
    assert_equal [], @world_cup.active_players_by_position("midfielder")    
  end
end
