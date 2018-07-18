require './lib/player'
require './lib/team'
require './lib/world_cup'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WorldCupTest < MiniTest::Test
  def test_it_exists
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_instance_of WorldCup, world_cup
  end
  def test_it_has_a_year
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal 2018, world_cup.year
  end
  def test_it_has_teams
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal [france, croatia], world_cup.teams
  end
  def test_it_can_call_active_players_by_position
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    modric = Player.new("Luka Modric", :midfielder)
    perisic = Player.new("Ivan Perisic", :forward)
    vida = Player.new("Domagoj Vida", :defender)

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    croatia.add_player(modric)
    croatia.add_player(perisic)
    croatia.add_player(vida)

    expected = [pogba, modric]
    actual = world_cup.active_players_by_position(:midfielder)
    assert_equal expected, actual
  end

  def test_it_can_call_active_players_by_position_after_elimination
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    modric = Player.new("Luka Modric", :midfielder)
    perisic = Player.new("Ivan Perisic", :forward)
    vida = Player.new("Domagoj Vida", :defender)

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    croatia.add_player(modric)
    croatia.add_player(perisic)
    croatia.add_player(vida)

    expected = [pogba, modric]
    actual = world_cup.active_players_by_position(:midfielder)
    assert_equal expected, actual

    croatia.eliminated
    expected_2 = [pogba]
    actual_2 = world_cup.active_players_by_position(:midfielder)
    assert_equal expected_2, actual_2
  end

  def test_it_can_print_out_players
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)
    modric = Player.new("Luka Modric", :midfielder)
    perisic = Player.new("Ivan Perisic", :forward)
    vida = Player.new("Domagoj Vida", :defender)

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    croatia.add_player(modric)
    croatia.add_player(perisic)
    croatia.add_player(vida)

    expected = "Defenders\n\t- Domagoj Vida\n\nForwards\n\t- Antoine Griezmann\n\t- Ivan Perisic\n\t- Kylian Mbappe\n\nMidfielders\n\t- Luka Modric\n\t- Paul Pogba"
    actual = world_cup.all_players
  end
end
