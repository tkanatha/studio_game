require_relative "game"

describe Game do
  let(:game) { Game.new("Game") }
  let(:initial_health) { 100 }
  let(:player) { Player.new("player", initial_health) }

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
end