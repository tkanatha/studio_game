require_relative "treasure_trove"
require_relative "loaded_die"

module GameTurn
  def self.take_turn(player)
    die = Die.new
    case die.roll_die
    when 1..2
      player.smash
    when 3..4
      puts "#{player.name} was skipped."
    else
      player.heal
    end
    treasure = TreasureTrove.random
    player.found_treasure(treasure)
  end
end