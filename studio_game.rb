require_relative "game"

warriors = Game.new("Warriors")
warriors.load_players(ARGV.shift || "players.csv")

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.downcase.chomp

  case answer
  when /^\d+$/
    warriors.play(answer.to_i) { warriors.total_points >= 2000 }
  when 'quit', 'exit'
    warriors.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

warriors.save_high_scores
# new game

# keith = Player.new("keith")
# lance = Player.new("lance", 50)
# sven = Player.new("sven", 25)

# voltron_force = Game.new("Voltron Force")
# voltron_force.add_player(keith)
# voltron_force.add_player(lance)
# voltron_force.add_player(sven)
# voltron_force.play(10) { voltron_force.total_points >= 2000 }
# voltron_force.print_stats