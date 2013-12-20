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

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.size} players in #{@title}: "
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

swan = Player.new("swan")
cowboy = Player.new("cowboy", 50)
ajax = Player.new("ajax")

warriors = Game.new("Warriors")
warriors.add_player(swan)
warriors.add_player(cowboy)
warriors.add_player(ajax)
warriors.play

keith = Player.new("keith")
lance = Player.new("lance", 50)
sven = Player.new("sven")

voltron_force = Game.new("Voltron Force")
voltron_force.add_player(keith)
voltron_force.add_player(lance)
voltron_force.add_player(sven)
voltron_force.play