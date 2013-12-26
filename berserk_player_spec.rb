require_relative 'berserk_player'

describe BerserkPlayer do
  
    let(:initial_health) { 50 } 
    let(:player) { BerserkPlayer.new("berserker", initial_health) }
  
  it "does not go berserk when healed up to 5 times" do
    1.upto(5) { player.heal }
    
    player.berserk?.should be_false
  end
  
  it "goes berserk when healed more than 5 times" do
    1.upto(6) { player.heal }
    
    player.berserk?.should be_true
  end
  
  it "gets w00ted instead of smashed when it's gone berserk" do  
    1.upto(6) { player.heal }
    1.upto(2) { player.smash }
    
    player.health.should == initial_health + (8 * 10)
  end

end