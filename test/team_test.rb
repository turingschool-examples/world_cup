require 'minitest/autorun'
require 'minitest/emoji'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test

  def test_it_exists
    france = Team.new("France")

    assert_instance_of Team, france
  end

  def test_it_has_a_country
    france = Team.new("France")

    assert_equal "France", france.country
  end

  def test_it_team_starts_with_zero_players
    france = Team.new("France")

    assert_equal [], france.players
  end

  def test_it_teams_start_not_eliminated
    france = Team.new("France")

    assert_equal false, france.eliminated?
  end

  def test_team_can_be_eliminated
    france = Team.new("France")

    france.eliminated = true
    assert_equal true, france.eliminated?
  end

end



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
# pry(main)> france.players
# #=> [#<Player:0x00007feab803f688...>, #<Player:0x00007feab7877a18...>, #<Player:0x00007feab71546f0...>]
#
# pry(main)> france.players_by_position(:midfielder)
# #=> [#<Player:0x00007feab71546f0...>]
#
# pry(main)> france.players_by_position(:forward)
# #=> [#<Player:0x00007feab803f688...>, #<Player:0x00007feab7877a18...>]
