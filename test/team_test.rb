require'minitest/autorun'
require'minitest/pride'
require'./lib/player'
require'./lib/team'
require'pry'

class TeamTest < Minitest::Test
  def setup
    @team = Team.new('France')
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  def test_it_exists
    # skip
    assert_instance_of Team, @team
  end

  def test_it_has_a_country
    # skip
    assert_equal 'France', @team.country
  end

  def test_it_is_elimniated
    # skip
    assert_equal false, @team.eliminated?
    @team.eliminated
    assert_equal true, @team.eliminated?
  end

  def test_it_has_players
    # skip
    assert_equal [], @team.players
  end

  def test_it_can_add_players
    # skip
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    assert_equal [@mbappe, @pogba], @team.players
  end

  def test_it_can_sort_by_position
    # skip
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    assert_equal [@pogba], @team.players_by_position("midfielder")
    assert_equal [], @team.players_by_position("defender")
  end
end
