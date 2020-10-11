require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require '../lib/player'     # => true


class PlayerTest < Minitest::Test  # => Minitest::Test

  def test_it_exists_and_has_attributes
    player = Player.new({name: "Luka Modric", position: "midfielder"})  # => #<Player:0x00007fa2150551e0 @info={:name=>"Luka Modric", :position=>"midfielder"}>

    assert_instance_of Player, player           # => true
    assert_equal "Luka Modric", player.name     # => true
    assert_equal "midfielder", player.position  # => true
  end                                           # => :test_it_exists_and_has_attributes
end                                             # => :test_it_exists_and_has_attributes

# >> Run options: --seed 30745
# >>
# >> # Running:
# >>
# >> .
# >>
# >> Finished in 0.000742s, 1347.7089 runs/s, 4043.1267 assertions/s.
# >>
# >> 1 runs, 3 assertions, 0 failures, 0 errors, 0 skips
