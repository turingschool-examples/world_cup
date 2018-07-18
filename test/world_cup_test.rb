require './lib/player'
require './lib/team'
require './lib/world_cup'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WorldCupTest < Minitest::Test

  def test_it_exists
    france = Team.new("France")
    croatia = Team.new("Croatia")
    wc = WorldCup.new(2018, [france, croatia])
    assert_instance_of WorldCup, wc
  end

  def test_it_has_a_year
    france = Team.new("France")
    croatia = Team.new("Croatia")
    wc = WorldCup.new(2018, [france, croatia])
    assert_equal 2018, wc.year
  end

  def test_it_has_teams
    france = Team.new("France")
    croatia = Team.new("Croatia")
    wc = WorldCup.new(2018, [france, croatia])
    assert_equal [france, croatia], wc.teams
  end

  def test_it_can_return_active_teams
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
    expected = [france, croatia]
    actual = world_cup.teams_not_eliminated
    assert_equal expected, actual
  end

  def test_it_can_return_active_players_by_position
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
    expected = [mbappe, griezmann, perisic]
    actual = world_cup.active_players_by_position(:forward)
    assert_equal expected, actual
  end

end
