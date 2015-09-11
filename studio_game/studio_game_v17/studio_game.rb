require_relative 'game'

player1 = Player.new("moe", 100)
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(3)
# knuckleheads.print_stats

# Another game
chipmunks = Game.new("Chipmunks")
player4 = Player.new("alvin", 90)
player5 = Player.new("simon", 90)
player6 = Player.new("theodore", 95)

chipmunks = Game.new("Knuckleheads")
chipmunks.add_player(player4)
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.play(2)


chipmunks.print_stats
knuckleheads.print_stats
