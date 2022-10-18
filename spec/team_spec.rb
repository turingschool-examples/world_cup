require './lib/player'
require './lib/team'

# Iteration 2
RSpec.describe Team do
  it 'exists' do
    team = Team.new("France")    
    
    expect(team).to be_a Team
    expect(team.country).to eq "France"
  end

  it 'is not eliminated' do
    team = Team.new("France") 
    
    expect(team.eliminated?).to eq false
  end

  it 'can be eliminated' do
    team = Team.new("France")
    team.eliminated = true

    expect(team.eliminated?).to eq true
  end

  it 'has no players' do
    team = Team.new("France")
    
    expect(team.players).to eq []
  end

  it 'can have players' do
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})  

    team.add_player(mbappe)
    team.add_player(pogba)
    
    expect(team.players).to eq [mbappe, pogba]
    expect(team.players_by_position("midfielder")).to eq [pogba]
    expect(team.players_by_position("forward")).to eq [mbappe]
    expect(team.players_by_position("defender")).to eq []
  end
end