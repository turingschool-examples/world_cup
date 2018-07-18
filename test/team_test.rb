require 'minitest/autorun'
require 'minitest/pride'
require './lib/player.rb'
require './lib/team.rb'


class TeamTest < Minitest::Test

  def test_team_exists
    france = Team.new("France")
    assert_instance_of Team , france

  end

  def test_it_has_a_country
    france = Team.new("France")
    assert_equal "France" , france.country
  end

  def test_team_has_players
    france = Team.new("France")

    assert_equal [], france.players

  end

  def test_elminated_default_is_false
    france = Team.new("France")

    assert_equal false , france.eliminated?

  end

  def test_that_team_can_be_eliminated
    france = Team.new("France",eliminated = true)


    assert_equal true , france.eliminated?
  end

  def test_you_can_add_players
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    assert_equal [mbappe, griezmann, pogba] , france.players

  end

  def test_you_can_find_by_position

    france = Team.new("France",eliminated = true)
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    assert_equal [pogba] , france.players_by_position(:midfielder)
    assert_equal [mbappe, griezmann] , france.players_by_position(:forward)


  end


end
