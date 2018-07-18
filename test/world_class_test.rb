require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require './lib/world_class'

class WorldCupTest < Minitest::Test

  def test_it_exists
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_instance_of WorldCup, world_cup
  end

  def test_it_has_attributes
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal 2018, world_cup.year
    assert_equal [france, croatia], world_cup.teams
  end

  def test_it_can_find_active_players_by_positions
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    croatia = Team.new("Croatia")
    modric = Player.new("Luka Modric", :midfielder)
    perisic = Player.new("Ivan Perisic", :forward)
    vida = Player.new("Domagoj Vida", :defender)

    world_cup = WorldCup.new(2018, [france, croatia])

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    croatia.add_player(modric)
    croatia.add_player(perisic)
    croatia.add_player(vida)

    expected = [mbappe, griezmann, perisic]

    assert_equal expected, world_cup.active_players_by_position(:forward)
  end

  def test_it_can_eliminate_teams
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    croatia = Team.new("Croatia")
    modric = Player.new("Luka Modric", :midfielder)
    perisic = Player.new("Ivan Perisic", :forward)
    vida = Player.new("Domagoj Vida", :defender)

    world_cup = WorldCup.new(2018, [france, croatia])

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    croatia.add_player(modric)
    croatia.add_player(perisic)
    croatia.add_player(vida)

    croatia.eliminated

    assert_equal true, croatia.eliminated?
  end

  def test_it_can_find_active_teams
    france = Team.new("France")
    croatia = Team.new("Croatia")
    world_cup = WorldCup.new(2018, [france, croatia])

    croatia.eliminated

    assert_equal [france], world_cup.find_active_teams
  end

  def test_eliminated_teams_cannot_show_active_players
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    croatia = Team.new("Croatia")
    modric = Player.new("Luka Modric", :midfielder)
    perisic = Player.new("Ivan Perisic", :forward)
    vida = Player.new("Domagoj Vida", :defender)

    world_cup = WorldCup.new(2018, [france, croatia])

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    croatia.add_player(modric)
    croatia.add_player(perisic)
    croatia.add_player(vida)

    croatia.eliminated

    expected = [mbappe, griezmann]

    assert_equal expected, world_cup.active_players_by_position(:forward)
  end

  def test_it_can_show_all_players
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    croatia = Team.new("Croatia")
    modric = Player.new("Luka Modric", :midfielder)
    perisic = Player.new("Ivan Perisic", :forward)
    vida = Player.new("Domagoj Vida", :defender)

    world_cup = WorldCup.new(2018, [france, croatia])

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    croatia.add_player(modric)
    croatia.add_player(perisic)
    croatia.add_player(vida)

    expected = "Defenders\n\t- Domagoj Vida\n\nForwards\n\t- Antoine Griezmann\n\t- Ivan Perisic\n\t- Kylian Mbappe\n\nMidfielders\n\t- Luka Modric\n\t- Paul Pogba"

    assert_equal expected, world_cup.all_players
  end

end
