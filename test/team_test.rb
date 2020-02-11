require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test

  def test_it_can_exist
    team = Team.new("France")

    assert_instance_of Team, team
  end
