require 'minitest'
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
    assert_instance_of Team, @france
    assert_instance_of Team, @croatia
  end

  def test_it_has_attributes
    assert_equal 2018, @world_cup.year
    assert_equal [@france, @croatia], @world_cup.teams
  end

  def test_active_players_by_position
    assert_equal [@pogba, @modric], @world_cup.active_players_by_position("midfielder")

  end


end



#
# pry(main)> france.add_player(mbappe)
#
# pry(main)> france.add_player(pogba)
#
# pry(main)> croatia = Team.new("Croatia")
# # => #<Team:0x00007f936a3afea8...>
#
# pry(main)> modric = Player.new({name: "Luka Modric", position: "midfielder"})
# # => #<Player:0x00007f936a3595f8...>
#
# pry(main)> vida = Player.new({name: "Domagoj Vida", position: "defender"})
# # => #<Player:0x00007f936a318f08...>
#
# pry(main)> croatia.add_player(modric)
#
# pry(main)> croatia.add_player(vida)
#
# pry(main)> world_cup = WorldCup.new(2018, [france, croatia])
# # => #<WorldCup:0x00007f936a010d10...>
#
# pry(main)> world_cup.year
# # => 2018
#
# pry(main)> world_cup.teams
# # => [#<Team:0x00007f936a313698...>, #<Team:0x00007f936a3afea8...>]
#
# pry(main)> world_cup.active_players_by_position("midfielder")
# # => [#<Player:0x00007f936c035eb0...>, #<Player:0x00007f936a3595f8...>]
#
# pry(main)> croatia.eliminated = true
#
# pry(main)> world_cup.active_players_by_position("midfielder")
# # => [#<Player:0x00007f936c035eb0...>]
# ```
