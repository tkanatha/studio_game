Treasure = Struct.new(:name, :points)

module TreasureTrove
  TREASURES = [
    Treasure.new(:knife, 5),
    Treasure.new(:hammer, 25),
    Treasure.new(:spear, 50),
    Treasure.new(:sickle, 100),
    Treasure.new(:axe, 200),
    Treasure.new(:sword, 400)
  ]

  def self.random
    TREASURES.sample
  end
end