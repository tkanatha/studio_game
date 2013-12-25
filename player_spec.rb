require_relative "player"
require_relative "treasure_trove"

describe Player do
  before do
    $stdout = StringIO.new
  end

  let(:initial_health) { 50 }
  let(:player) { Player.new("player", initial_health) }

  it "has a capitialized name" do

    player.name.should == "Player"

  end

  it "has an initial health" do

    player.health.should == initial_health

  end

  it "has a string representation" do

    player.found_treasure(Treasure.new(:hammer, 25))
    player.found_treasure(Treasure.new(:hammer, 25))

    player.to_s.should == "Player has 50 health and 50 points for a score of 100."

  end
  
  it "computes a score as the sum of its health and length of name" do

    player.found_treasure(Treasure.new(:hammer, 25))
    player.found_treasure(Treasure.new(:hammer, 25))

    player.score.should == 100

  end

  it "increases health by 10 when healed" do
    player.heal
    player.health.should == 50 + 10
  end

  it "decreases health by 5 when smashed" do
    player.smash
    player.health.should == (50 - 5)
  end

  context "with a health greater than 150" do
    let(:player) { Player.new("player", 150) }

    it "is strong" do
      player.should be_strong
    end
  end

  context "with a health less than or equal to 100" do
    let(:player) { Player.new("player", 100) }

    it "is weak" do
      player.should_not be_strong
    end
  end

  context "in a collection of players" do
    let(:player1) { Player.new("player1", 100) }
    let(:player2) { Player.new("player2", 200) }
    let(:player3) { Player.new("player3", 300) }
    let(:players) { [player1, player2, player3] }

    it "is sorted by decreasing score" do
      players.sort.should == [player3, player2, player1]
    end

    it "computes points as the sum of all treasure points" do
      player1.points.should == 0

      player1.found_treasure(Treasure.new(:hammer, 50))

      player1.points.should == 50

      player1.found_treasure(Treasure.new(:sword, 400))

      player1.points.should == 450

      player1.found_treasure(Treasure.new(:hammer, 50))

      player1.points.should == 500
    end

    it "yields each found treasure and its total points" do
      player1.found_treasure(Treasure.new(:sickle, 100))
      player1.found_treasure(Treasure.new(:sickle, 100))
      player1.found_treasure(Treasure.new(:spear, 50))
      player1.found_treasure(Treasure.new(:knife, 5))
      player1.found_treasure(Treasure.new(:knife, 5))
      player1.found_treasure(Treasure.new(:knife, 5))
      player1.found_treasure(Treasure.new(:knife, 5))
      player1.found_treasure(Treasure.new(:knife, 5))

      yielded = []
      player1.each_found_treasure do |treasure|
        yielded << treasure
      end

      yielded.should == [
        Treasure.new(:sickle, 200), 
        Treasure.new(:spear, 50), 
        Treasure.new(:knife, 25)
      ]
    end
    it "can be created from a CSV string" do  
      player1 = Player.from_csv("player1,100")

      player1.name.should == "Player1"
      player1.health.should == 100
    end
  end
end