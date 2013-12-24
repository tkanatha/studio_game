require_relative 'treasure_trove'
   
describe Treasure do
  
  let(:treasure) { Treasure.new(:hammer, 50) }
  
  it "has a name attribute" do
    treasure.name.should == :hammer
  end
  
  it "has a points attribute" do
    treasure.points.should == 50
  end
  
end

describe TreasureTrove do
  
  it "has six treasures" do
    TreasureTrove::TREASURES.size.should == 6
  end
  
  it "has a knife worth 5 points" do
    TreasureTrove::TREASURES[0].should == Treasure.new(:knife, 5)
  end
  
  it "has a hammer worth 25 points" do
    TreasureTrove::TREASURES[1].should == Treasure.new(:hammer, 25)
  end
  
  it "has a spear worth 50 points" do
    TreasureTrove::TREASURES[2].should == Treasure.new(:spear, 50)
  end
  
  it "has a sickle worth 100 points" do
    TreasureTrove::TREASURES[3].should == Treasure.new(:sickle, 100)
  end

  it "has a axe worth 200 points" do
    TreasureTrove::TREASURES[4].should == Treasure.new(:axe, 200)
  end
  
  it "has a sword worth 400 points" do
    TreasureTrove::TREASURES[5].should == Treasure.new(:sword, 400)
  end

  it "returns a random treasure" do
    treasure = TreasureTrove.random

    TreasureTrove::TREASURES.should include(treasure)
  end
end