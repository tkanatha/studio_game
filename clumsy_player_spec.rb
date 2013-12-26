require_relative 'clumsy_player'

describe ClumsyPlayer do
    let(:player) { ClumsyPlayer.new("klutz") }
  
  it "only gets half the point value for each treasure" do
    player.points.should == 0

    hammer = Treasure.new(:hammer, 25)
    player.found_treasure(hammer)
    player.found_treasure(hammer)
    player.found_treasure(hammer)

    player.points.should == 37.5

    sword = Treasure.new(:sword, 400)
    player.found_treasure(sword)
    
    player.points.should == 237.5 
    
    yielded = []
    player.each_found_treasure do |treasure|
      yielded << treasure
    end

    yielded.should == [Treasure.new(:hammer, 37.5), Treasure.new(:sword, 200)]    
  end

  context "with a boost factor" do
      let(:initial_health) { 100 }
      let(:boost) { 5 }  
      let(:player) { ClumsyPlayer.new("klutz", initial_health, boost) }
    
    it "has a boost factor" do
      player.boost.should == 5
    end

    it "gets boost factor number of heals when healed" do
      player.heal

      player.health.should == initial_health + (10 * boost)
    end
  end
end