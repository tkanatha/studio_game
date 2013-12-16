player1 = "larry"
health1 = 60
player2 = "curly"
health2 = 125

current_time = Time.new
formatted_time = current_time.strftime("%A %m/%d/%y at %I:%M%p")

puts "#{player1.capitalize} has a health of #{health1}."
puts "#{player2.upcase} has a health of #{health2}."

health2 = health1

puts "#{player1.capitalize} has a health of #{health1}."
puts "#{player2.upcase} has a health of #{health2}."

health1 = 30

puts "#{player1.capitalize} has a health of #{health1}."
puts "#{player2.upcase} has a health of #{health2}."

player3 = "moe"
health3 = 100

puts "#{player3.capitalize} has a health of #{health3}".center(50, '*')

player4 = "shemp"
health4 = 90

puts "#{player4.capitalize.ljust(20,'.')} #{health4} health"

puts "\nThe game started at #{formatted_time}"
