require "./lib/player"

describe Player do

  before do
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
  end

  it "has a name" do
    expect(@player.name).to eq("Luka Modric")
  end

  it "has a position" do
    expect(@player.position).to eq("midfielder")
  end
end
