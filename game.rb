require_relative "die"
require_relative "game_turn"
require_relative "treasure_trove"

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

  def play(rounds)
    puts "\nThere are #{@players.size} players in #{@title}: \n\n"
    @players.each do |player|
      puts player
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
        @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures in the game."
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end
  end

  def print_stats
    puts "\n#{@title} Statistics:\n"
    strong_players, weak_players = @players.partition { |player| player.strong? }

    puts "#{strong_players.size} strong players:"
    strong_players.each { |player| print_name_and_health(player) }
    puts "\n#{weak_players.size} weak players:"
    weak_players.each { |player| print_name_and_health(player) }

    puts "\n#{@title} High Scores:"
    @players.sort.each { |player| puts "#{player.name.ljust(30, ".")} #{player.score}" }

    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end

    puts "\n#{total_points} total treasure points found"
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
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