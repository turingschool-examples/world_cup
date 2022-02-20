require 'pry'
require './lib/player'
require './lib/team'

describe Team do
  team = Team.new('France')

  it "is from a country" do
    expect(team.country).to eq('France')
  end

  it "is not eliminated" do
    expect(team.eliminated?).to be false
  end

  it "can have players" do
    expect(team.players).to eq([])
  end

  mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
  pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

  it "can add players to the roster" do
    team.add_player(mbappe)
    team.add_player(pogba)
    expect(team.players).to eq([mbappe, pogba])
  end

  it "can identify players by position" do
    expect(team.players_by_position("midfielder")).to eq([pogba])
    expect(team.players_by_position("forward")).to eq([mbappe])
    expect(team.players_by_position("defender")).to eq([])
  end
end
