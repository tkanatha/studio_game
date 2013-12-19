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
sally = Player.new("sally", 50)
harriet = Player.new("harriet")

players = [john, sally, harriet]
puts "There are #{players.size} players in the game."
players.each do |player|
  player.smash
  player.heal
  player.heal
  puts player
end

players.pop
joe = Player.new("joe", 90)
players.push(joe)

puts "There are #{players.size} players in the game."
players.each do |player|
  player.smash
  player.heal
  player.heal
  puts player
end