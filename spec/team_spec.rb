require "./lib/player"
require "./lib/team"

describe Team do

  before do
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  it "has a country" do
    expect(@team.country).to eq("France")
  end

  it "is not eliminated by default" do
    expect(@team.eliminated).to be false
  end

  context "change eliminated" do
    before do
      @team.eliminated = true
    end

    it "can be eliminated" do
      expect(@team.eliminated).to be true
    end

    context "add players" do

      before do
        @team.add_player(@mbappe)
        @team.add_player(@pogba)
      end

      it "has players" do
        expect(@team.players).to eq[@mbappe, @pogba]
      end

      it "has players by position"
        expect(@team.players_by_position("midfielder")).to eq(@pogba)
        expect(@team.players_by_position("defender")).to_eq(@mbappe)
      end
    end
  end
