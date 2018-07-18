require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require './lib/world_cup'

class WorldCupTest < Minitest::Test

  def setup
    @mbappe = Player.new("Kylian Mbappe", :forward)
    @griezmann = Player.new("Antoine Griezmann", :forward)
    @pogba = Player.new("Paul Pogba", :midfielder)
    @france = Team.new("France")
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
    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_it_exists
    assert_instance_of WorldCup, @world_cup
  end

  def test_it_has_a_year
    assert_equal 2018, @world_cup.year
  end

  def test_it_lists_teams
    assert_equal [@france, @croatia], @world_cup.teams
  end

  def test_it_gives_active_players_by_position
    actual = @world_cup.active_players_by_position(:forward)
    expected = [@mbappe, @griezmann, @perisic]

    assert_equal expected, actual

    @croatia.eliminated

    actual = @world_cup.active_players_by_position(:forward)
    expected = [@mbappe, @griezmann]
  end

  def test_it_can_print_the_players_with_position
    skip
    actual = @world_cup.all_players
    expected = "Defenders\n\t- Domagoj Vida\n\nForwards\n\t- Antoine Griezmann\n\t- Ivan Perisic\n\t- Kylian Mbappe\n\nMidfielders\n\t- Luka Modric\n\t- Paul Pogba"

    assert_equal expected, actual
  end

  def test_we_get_all_positions
    expected = @world_cup.get_positions
    actual = [:forward, :midfielder, :defender]

    assert_equal expected, actual
  end

  def test_it_makes_positions_keys
    expected = @world_cup.makes_keys.keys
    actual = [:forward, :midfielder, :defender]

    assert_equal expected, actual
  end

  def test_it_formats_positions
    expected = @world_cup.format_titles
    actual = %w[Defenders Forwards Midfielders]

    assert_equal expected, actual
  end

  def test_it_sorts_players_into_hash
    skip
    expected = @world_cup.players_into_values[:midfielder]
    actual = [@modric, @pogba]

    assert_equal expected, actual
  end
end
