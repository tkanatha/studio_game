class Game
  require_relative "player"

  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "\nThere are #{@players.size} players in #{@title}: \n\n"
    @players.each do |player|
      puts player
    end
    @players.each do |player|
      player.smash
      player.heal
      player.heal
      puts player
    end
  end
end

# Example code below only runs when game.rb is executed from the command line

if __FILE__ == $0
  player1 = Player.new("player1", 50)
  player2 = Player.new("player2", 75)
  player3 = Player.new("player3")

  game = Game.new("Game")
  game.add_player(player1)
  game.add_player(player2)
  game.add_player(player3)
  game.play
end