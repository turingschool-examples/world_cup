require './lib/player'
require './lib/team'
require './lib/world_cup'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'

class WorldCupTest < MiniTest::Test

    def test_existence
      wc = WorldCup.new(2000, "france")
      assert_instance_of WorldCup, wc
    end

    def test_attribues
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
      result = world_cup.teams
      expected = [france, croatia]
      assert_equal expected, result
      result = world_cup.year
      expected = 2018
      assert_equal expected, result
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
      result = world_cup.active_players_by_position(:forward)
      expected = [mbappe, griezmann, perisic]
      assert_equal expected, result
      croatia.eliminated
      result = world_cup.active_players_by_position(:forward)
      expected = [mbappe, griezmann]
      assert_equal expected, result
    end

    def test_all_players
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
      result = world_cup.all_players
      expected = "Defenders\n -Domagoj Vida\n Forwards\n-Kylian Mbappe \n-Antoine Griezmann\n-Ivan Perisic\n Midfielders\n-Paul Pogba\n-Luka Modric"
      assert_equal expected, result
    end
end
