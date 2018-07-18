require 'pry'
require "./lib/player.rb"
require "./lib/team.rb"
require "minitest/autorun"
require "minitest/pride"

class TeamTest < Minitest::Test

  def test_player_has_attributes
    france = Team.new("France")

    assert_equal "France", france.country
    assert_equal [], france.players
    assert_equal false, france.eliminated?
    # assert_equal true, france.eliminated? == true

  end

  def test_player_can_be_added_to_team
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)
    france.players


    france.players_by_position(:midfielder)
    
    france.players_by_position(:forward)


  end


end
