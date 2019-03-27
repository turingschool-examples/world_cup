require "./lib/player"
require "./lib/team"
require "./lib/world_cup"

describe WorldCup do

  before do
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)

    @croatia = Team.new("Croatioa")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)

    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  it "has a year" do
    expect(@world_cup.year).to eq(2018)
  end

  it "has two teams" do
    expect(@world_cup.teams).to eq([@france, @croatia])
  end

  it "can list players by position" do
    expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba, @modric])
  end

  context "eliminated croatia" do
    before do
      @croatia.eliminated = true
    end

    it "active players update according to which teams are eliminated" do
      expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba, @modric])
    end
  end
end
