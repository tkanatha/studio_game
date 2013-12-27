require_relative "auditable"

class LoadedDie
  include Auditable
  
  attr_reader :number

  def roll_die
    numbers = [1,1,3,5,6,6]
    @number = numbers.sample
    audit
    @number
  end
end