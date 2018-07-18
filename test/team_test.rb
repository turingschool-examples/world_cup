require "pry"
require "minitest/autorun"
require "minitest/pride"
require "./lib/team"

class TeamTest < Minitest::Test

  def test_if_it_exists
    france = Team.new("France")

    assert_instance_of
  end

end
