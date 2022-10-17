require './lib/player'

RSpec.describe Player do
  it 'exists' do
    player = Player.new({name: "Luka Modric", position: "midfielder"})    
    
    expect(player).to be_a Player
    expect(player.name).to eq "Luka Modric"
  end
end