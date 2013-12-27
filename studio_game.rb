require_relative "game"
require_relative "clumsy_player"
require_relative "berserk_player"

warriors = Game.new("Warriors")
warriors.load_players(ARGV.shift || "players.csv")

ditzy = ClumsyPlayer.new("ditzy",105, 5)
warriors.add_player(ditzy)

nutty = BerserkPlayer.new("nutty",50)
warriors.add_player(nutty)

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.downcase.chomp

  case answer
  when /^\d+$/
    warriors.play(answer.to_i) { warriors.total_points >= 200000 }
  when 'quit', 'exit'
    warriors.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

warriors.save_high_scores
