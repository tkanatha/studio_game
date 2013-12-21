class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def name=(name_change)
    @name = name_change.capitalize
  end

  def to_s
    "#{@name} has a health of #{@health} and a score of #{score}."
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
    @health + @name.length
  end

  def strong?
    @health > 100
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