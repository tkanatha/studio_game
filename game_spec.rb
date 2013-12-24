require_relative "game"

describe Game do
  let(:game) { Game.new("Game") }
  let(:initial_health) { 100 }
  let(:player) { Player.new("player", initial_health) }
  let(:player1) { Player.new("player1") }
  let(:player2) { Player.new("player2") }


  before do
    $stdout = StringIO.new
    game.add_player(player)
  end

  it "heals the player if a a high number is rolled" do
    Die.any_instance.stub(:roll_die).and_return(6)

    game.play(2)

    player.health.should == initial_health + (10 * 2)
  end

  it "skips the player if a a medium number is rolled" do
    Die.any_instance.stub(:roll_die).and_return(4)

    game.play(2)

    player.health.should == initial_health
  end

  it "smashes the player if a a low number is rolled" do
    Die.any_instance.stub(:roll_die).and_return(2)

    game.play(2)

    player.health.should == initial_health - (5 * 2)
  end

  it "assigns a treasure for points during a player's turn" do     
    game = Game.new("Team")
    player = Player.new("moe")
       
    game.add_player(player)
    
    game.play(1)
    
    player.points.should_not be_zero
  end

  it "computes total points as the sum of all player points" do
    
    game.add_player(player1)
    game.add_player(player2)
    
    player1.found_treasure(Treasure.new(:hammer, 25))
    player1.found_treasure(Treasure.new(:hammer, 25))
    player2.found_treasure(Treasure.new(:sword, 400))
    
    game.total_points.should == 450
  end
end