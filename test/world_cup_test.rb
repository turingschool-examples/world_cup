require 'minitest/pride'
require 'minitest/autorun'
require './lib/world_cup'
require './lib/team'
require './lib/player'

class WorldCupTest < Minitest::Test

  def setup
    @france = Team.new("France")
    @mbappe = Player.new("Kylian Mbappe", :forward)
    @griezmann = Player.new("Antoine Griezmann", :forward)
    @pogba = Player.new("Paul Pogba", :midfielder)
    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)
    @croatia = Team.new("Croatia")
    @modric = Player.new("Luka Modric", :midfielder)
    @perisic = Player.new("Ivan Perisic", :forward)
    @vida = Player.new("Domagoj Vida", :defender)
    @croatia.add_player(@modric)
    @croatia.add_player(@perisic)
    @croatia.add_player(@vida)
  end

  def test_it_exists
    wc = WorldCup.new(2018, [])

    assert_instance_of WorldCup, wc
  end

  def test_it_has_attributes
    wc = WorldCup.new(2018, [@france, @croatia])

    assert_equal 2018, wc.year
    assert_equal [@france, @croatia], wc.teams
  end

  def test_we_can_get_active_players_by_position
    wc = WorldCup.new(2018, [@france, @croatia])
    assert_equal [@mbappe,
                  @griezmann,
                  @perisic], wc.active_players_by_position(:forward)

    @croatia.eliminated = true
    assert_equal [@mbappe, @griezmann], wc.active_players_by_position(:forward)
  end

  def test_we_can_create_an_array_of_all_players
    wc = WorldCup.new(2018, [@france, @croatia])
    require 'pry' ; binding.pry
    assert_equal [@mbappe, @griezmann, @pogba, @modric, @perisic, @vida], wc.create_all_players_array
  end

end
