require_relative "game"

swan = Player.new("swan")
cowboy = Player.new("cowboy", 50)
ajax = Player.new("ajax")

warriors = Game.new("Warriors")
warriors.add_player(swan)
warriors.add_player(cowboy)
warriors.add_player(ajax)
warriors.play

# new game

keith = Player.new("keith")
lance = Player.new("lance", 50)
sven = Player.new("sven")

voltron_force = Game.new("Voltron Force")
voltron_force.add_player(keith)
voltron_force.add_player(lance)
voltron_force.add_player(sven)
voltron_force.play