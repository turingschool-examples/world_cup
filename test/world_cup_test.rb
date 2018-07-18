require 'minitest/autorun'
require 'minitest/emoji'
require './lib/player'
require './lib/team'
require './lib/world_cup'

class WorldCupTest < Minitest::Test

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

  def test_it_can_list_active_players_by_position
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
    assert_equal [mbappe, griezmann, perisic], actual

    croatia.eliminated = true

    actual = world_cup.active_players_by_position(:forward)
    assert_equal [mbappe, griezmann], actual
  end


end
# pry(main)> france = Team.new("France")
# #=> #<Team:0x00007feab6adeca8...>
#
# pry(main)> mbappe = Player.new("Kylian Mbappe", :forward)
# #=> #<Player:0x00007feab803f688...>
#
# pry(main)> griezmann = Player.new("Antoine Griezmann", :forward)
# #=> #<Player:0x00007feab7877a18...>
#
# pry(main)> pogba = Player.new("Paul Pogba", :midfielder)
# #=> #<Player:0x00007feab71546f0...>
#
# pry(main)> france.add_player(mbappe)
# #=> [#<Player:0x00007feab803f688...>]
#
# pry(main)> france.add_player(griezmann)
# #=> [#<Player:0x00007feab803f688...>, #<Player:0x00007feab7877a18...>]
#
# pry(main)> france.add_player(pogba)
# #=> [#<Player:0x00007feab803f688...>, #<Player:0x00007feab7877a18...>, #<Player:0x00007feab71546f0...>]
#
# pry(main)> croatia = Team.new("Croatia")
# #=> #<Team:0x00007fce3c0b83c8...>
#
# pry(main)> modric = Player.new("Luka Modric", :midfielder)
# #=> #<Player:0x00007fce3b996450...>
#
# pry(main)> perisic = Player.new("Ivan Perisic", :forward)
# #=> #<Player:0x00007fce3d0891f8...>
#
# pry(main)> vida = Player.new("Domagoj Vida", :defender)
# #=> #<Player:0x00007fce3bb69b10...>
#
# pry(main)> croatia.add_player(modric)
# #=> [#<Player:0x00007fce3b996450...>]
#
# pry(main)> croatia.add_player(perisic)
# #=> [#<Player:0x00007fce3b996450...>, #<Player:0x00007fce3d0891f8...>]
#
# pry(main)> croatia.add_player(vida)
# #=> [#<Player:0x00007fce3b996450...>, #<Player:0x00007fce3d0891f8...>, #<Player:0x00007fce3bb69b10...>]
#
# pry(main)> world_cup = WorldCup.new(2018, [france, croatia])
# #=> #<WorldCup:0x00007fce3b908858...>
#
# pry(main)> world_cup.year
# #=> 2018
#
# pry(main)> world_cup.teams
# #=> [#<Team:0x00007fce3c091f70...>, #<Team:0x00007fce3c0b83c8...>
#
# pry(main)> world_cup.active_players_by_position(:forward)
# #=> [#<Player:0x00007feab803f688...>, #<Player:0x00007feab7877a18...>, #<Player:0x00007fce3d0891f8...>]
#
# pry(main)> croatia.eliminated = true
# #=> true
#
# pry(main)> world_cup.active_players_by_position(:forward)
# #=> [#<Player:0x00007feab803f688...>, #<Player:0x00007feab7877a18...>]
