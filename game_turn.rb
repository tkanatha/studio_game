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

  end
end