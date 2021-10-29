require './lib/player'

RSpec.describe Player do
  before :each do
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
  end

  it 'exists' do
    expect(@player).to be_an_instance_of(Player)
  end

  it 'has attributes' do
    expect(@player.name).to eq('Luka Modric')
    expect(@player.position).to eq('midfielder')
  end
end
