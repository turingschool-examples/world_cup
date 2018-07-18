require './lib/player'
require './lib/team'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class TeamTest < MiniTest::Test

  def test_existence
    t = Team.new("France")
    assert_instance_of Team, t
  end

  def test_attributes
    t = Team.new("France")
    result = t.country
    expected = "France"
    assert_equal expected, result
    result = t.players
    expected = []
    assert_equal expected, result
  end

  def test_elimination
      t = Team.new("France")
      result = t.eliminated?
      expected = false
      assert_equal expected, result
      t.eliminated
      result = t.eliminated?
      expected = true
      assert_equal expected, result
    end

    def test_team_players
      t = Team.new("France")
      mbappe = Player.new("Kylian Mbappe", :forward)
      griezmann = Player.new("Antoine Griezmann", :forward)
      binding.pry
      pogba = Player.new("Paul Pogba", :midfielder)
      t.add_player(mbappe)
      t.add_player(griezmann)
      t.add_player(pogba)
      result = t.players
      expected = [mbappe, griezmann, pogba]
      assert_equal expected,result
    end

    def test_players_by_position
      t = Team.new("France")
      mbappe = Player.new("Kylian Mbappe", :forward)
      griezmann = Player.new("Antoine Griezmann", :forward)
      pogba = Player.new("Paul Pogba", :midfielder)
      t.add_player(mbappe)
      t.add_player(griezmann)
      t.add_player(pogba)
      result = t.players_by_position(:forward)
      expected = [mbappe, griezmann]
      assert_equal expected, result
    end



end
