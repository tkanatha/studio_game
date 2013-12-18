class Player
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "#{@name} has a health of #{@health}."
  end

  def heal
    @health += 10
    puts "#{@name} got healed!"
  end

  def smash
    @health -= 5
    puts "#{@name} got smashed!"
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