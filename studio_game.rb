def say_hello(name, health=0)
  "I'm #{name.capitalize} with a health of #{health} as of#{time}."
end

def time
  current_time = Time.new
  current_time.strftime("%l:%M:%S %p")
end

puts say_hello("john", 7)
puts say_hello("jane", 8)
puts say_hello("sally", 4)
puts say_hello("sam")