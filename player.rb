require_relative "treasure_trove"

class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def name=(name_change)
    @name = name_change.capitalize
  end

  def to_s
    "#{@name} has #{@health} health and #{points} points for a score of #{score}."
  end

  def heal
    @health += 10
    puts "#{@name} got healed!"
  end

  def smash
    @health -= 5
    puts "#{@name} got smashed!"
  end

  def score
    @health + points
  end

  def strong?
    @health > 100
  end

  def <=>(other)
    other.score <=> score
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{name} found a #{treasure.name} worth #{treasure.points}"
    puts "#{name}'s treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      yield Treasure.new(name, points)
    end
  end

  def self.from_csv(string)
    name, health = string.split(',')
    player = Player.new(name, Integer(health))
  end
end

# Example code below only runs when player.rb is executed from the command line

if __FILE__ == $0
  player1 = Player.new("player1")
  player1.name
  player1.smash
  player1.heal
  puts player1
end