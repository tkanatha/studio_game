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
end

john = Player.new("john")
puts john
john.smash
puts john
john.heal
puts john

sally = Player.new("sally", 50)
puts sally
sally.heal
puts sally
sally.smash
puts sally

harriet = Player.new("harriet")
puts harriet
harriet.smash
puts harriet
harriet.smash
puts harriet
