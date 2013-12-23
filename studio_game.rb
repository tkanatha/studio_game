require_relative "game"

swan = Player.new("swan")
cowboy = Player.new("cowboy", 50)
ajax = Player.new("ajax", 75)

warriors = Game.new("Warriors")
warriors.add_player(swan)
warriors.add_player(cowboy)
warriors.add_player(ajax)
warriors.play(2)
warriors.print_stats

# new game

keith = Player.new("keith")
lance = Player.new("lance", 50)
sven = Player.new("sven", 25)

voltron_force = Game.new("Voltron Force")
voltron_force.add_player(keith)
voltron_force.add_player(lance)
voltron_force.add_player(sven)
voltron_force.play(2)
voltron_force.print_stats