require './lib/player'
require './lib/team'
require './lib/world_cup'
require 'minitest/autorun'
require 'minitest/pride'

class WorldCupTest < MiniTest::Test

  def test_can_add_new_team_and_players
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    croatia = Team.new("Croatia")
    modric = Player.new("Luka Modric", :midfielder)
    perisic = Player.new("Ivan Perisic", :forward)
    vida = Player.new("Domagoj Vida", :defender)
    croatia.add_player(modric)
    croatia.add_player(perisic)
    croatia.add_player(vida)
    world_cup = WorldCup.new(2018, [france, croatia])

    actual = world_cup.year
    expected = 2018
    assert_equal expected, actual

    actual = world_cup.teams
    expected = [france, croatia]
    assert_equal expected, actual
  end

  def test_active_players_by_position
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    croatia = Team.new("Croatia")
    modric = Player.new("Luka Modric", :midfielder)
    perisic = Player.new("Ivan Perisic", :forward)
    vida = Player.new("Domagoj Vida", :defender)
    croatia.add_player(modric)
    croatia.add_player(perisic)
    croatia.add_player(vida)
    world_cup = WorldCup.new(2018, [france, croatia])

    actual = world_cup.active_players_by_position(:forward)
    expected = [mbappe, griezmann]

    assert_equal expected, actual
  end


end
