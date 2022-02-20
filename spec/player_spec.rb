require 'pry'
require './lib/player'

describe Player do
  player = Player.new({name: "Luka Modric", position: "midfielder"})

  it "has a name and position" do
    expect(player.name).to eq("Luka Modric")
    expect(player.position).to eq("midfielder")
  end
end
