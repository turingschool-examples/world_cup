require 'pry'
require './lib/player'
require './lib/team'
require './lib/world_cup'

describe WorldCup do

  france = Team.new("France")
  mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
  pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  france.add_player(mbappe)
  france.add_player(pogba)

  croatia = Team.new("Croatia")
  modric = Player.new({name: "Luka Modric", position: "midfielder"})
  vida = Player.new({name: "Luka Modric", position: "defender"})
  croatia.add_player(modric)
  croatia.add_player(vida)

  world_cup = WorldCup.new(2018, [france, croatia])

  it "has a year and teams" do
    expect(world_cup.year).to eq(2018)
    expect(world_cup.teams).to eq([france, croatia])
  end

  it "has active players in different positions" do
    expect(world_cup.active_players_by_position("midfielder")).to eq([pogba, modric])
  end

  it "removes players who's team has been eliminated" do
    croatia.eliminated = true
    expect(world_cup.active_players_by_position("midfielder")).to eq([pogba])
  end
end
