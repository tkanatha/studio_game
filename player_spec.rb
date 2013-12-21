require_relative "player"

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

    player.to_s.should == "Player has a health of 50 and a score of 56."

  end
  
  it "computes a score as the sum of its health and length of name" do

    player.score.should == 50 + 6

  end

  it "increases health by 10 when healed" do
    player.heal
    player.health.should == 50 + 10
  end

  it "decreases health by 5 when smashed" do
    player.smash
    player.health.should == (50 - 5)
  end
end