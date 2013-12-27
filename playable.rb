module Playable
  def heal
    self.health += 10
    puts "#{name} got healed!"
  end

  def smash
    self.health -= 5
    puts "#{name} got smashed!"
  end

  def strong?
    health > 100
  end
end