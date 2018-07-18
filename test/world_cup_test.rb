require "minitest/autorun"
require "minitest/pride"
require "./lib/player.rb"
require "./lib/team.rb"
require "./lib/world_cup.rb"
require "pry"

class WorldCupTest < Minitest::Test
  attr_reader :france, :mbappe, :griezmann, :pogba,
              :croatia, :modric, :perisic, :vida

  def setup
    @france = Team.new("France")
    @mbappe = Player.new("Kylian Mbappe", :forward)
    @griezmann = Player.new("Antoine Griezmann", :forward)
    @pogba = Player.new("Paul Pogba", :midfielder)
    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    @croatia = Team.new("Croatia")
    @modric = Player.new("Luka Modric", :midfielder)
    @perisic = Player.new("Ivan Perisic", :forward)
    @vida = Player.new("Domagoj Vida", :defender)
    croatia.add_player(modric)
    croatia.add_player(perisic)
    croatia.add_player(vida)
  end

  def test_it_exists
    world_cup = WorldCup.new(2018, [@france, @croatia])
    assert_instance_of WorldCup, world_cup
  end

  def test_it_has_attributes
    world_cup = WorldCup.new(2018, [@france, @croatia])
    assert_equal 2018, world_cup.year
    assert_equal [@france, @croatia], world_cup.teams
  end

  def test_active_players_by_position
    croatia = @croatia
    world_cup = WorldCup.new(2018, [@france, @croatia])
    assert_equal [@mbappe, @griezmann, @perisic], world_cup.active_players_by_position(:forward)
    croatia.eliminated
    assert_equal [@mbappe, @griezmann], world_cup.active_players_by_position(:forward)
  end

  # def test_all_players
  #   skip
  #   world_cup = WorldCup.new(2018, [@france, @croatia])
  #   assert_equal "Defenders\n\t- Domagoj Vida\n\nForwards\n\t- Antoine Griezmann\n\t- Ivan Perisic\n\t- Kylian Mbappe\n\nMidfielders\n\t- Luka Modric\n\t- Paul Pogba", world_cup.all_players
  #   @croatia.eliminated
  #   assert_equal "Forwards\n\t- Antoine Griezmann\n\t- Kylian Mbappe\n\nMidfielders\n\t- Paul Pogba", world_cup.all_players
  # end
end
