require_relative "auditable"

class Die
  include Auditable

  attr_reader :number

  def initialize
    roll_die
  end

  def roll_die
    @number = rand(1..6)
    audit
    @number
  end
end