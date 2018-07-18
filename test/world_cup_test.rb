require 'minitest/autorun'
require 'minitest/pride'
require './lib/world_cup'
require './lib/team'
require './lib/player'

class WorldCupTest < Minitest::Test

  def test_it_exists
    # skip
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_instance_of WorldCup, world_cup
  end

  def test_a_world_cup_has_a_year
    # skip
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal 2018, world_cup.year
  end

  def test_a_world_cup_has_teams
    # skip
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal [france, croatia], world_cup.teams
  end

  def test_it_can_find_active_players_by_position
    # skip
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

  def test_it_can_find_player_by_position_after_a_team_has_been_eliminated
    # skip
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

    croatia.eliminate_team

    world_cup = WorldCup.new(2018, [france, croatia])

    expected = [mbappe, griezmann]
    actual = world_cup.active_players_by_position(:forward)

    assert_equal expected, actual
  end

  def test_it_can_produce_a_roster
    # skip
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

    world_cup.format_position

    expected = "Defenders\n\t- Domagoj Vida\n\nForwards\n\t- Antoine Griezmann\n\t- Ivan Perisic\n\t- Kylian Mbappe\n\nMidfielders\n\t- Luka Modric\n\t- Paul Pogba"
    actual = world_cup.all_players

    assert_equal expected, actual

  end

end
