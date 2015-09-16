require_relative 'game'
require_relative 'clumsy_player'
require_relative 'berserk_player'

# player1 = Player.new("moe", 100)
# player2 = Player.new("larry", 60)
# player3 = Player.new("curly", 125)

game = StudioGame::Game.new("Knuckleheads")
game.load(ARGV.shift || "players.csv")

klutz = StudioGame::ClumsyPlayer.new("klutz", 105)
berserker = StudioGame::BerserkPlayer.new("berserker", 50)
game.add_player(klutz)
game.add_player(berserker)
# knuckleheads.add_player(player1)
# knuckleheads.add_player(player2)
# knuckleheads.add_player(player3)
# knuckleheads.play(3)


loop do
	puts "How many rounds? ('quit' to exit)"
	answer = STDIN.gets.chomp.downcase
	case answer
	when /^\d+$/
		puts "Let's play for #{answer} rounds"
		game.play(answer.to_i)
		# game.play(answer.to_i) do 
		# 	game.total_points >= 20000
		# end
	when 'quit', 'exit'
		game.print_stats
		break
	else
		puts "Please enter a name or 'quit'"
	end
end

game.save_high_scores(to_file="high_scores.txt")
	

	


# # Another game
# chipmunks = Game.new("Chipmunks")
# player4 = Player.new("alvin", 90)
# player5 = Player.new("simon", 90)
# player6 = Player.new("theodore", 95)

# chipmunks = Game.new("Knuckleheads")
# chipmunks.add_player(player4)
# chipmunks.add_player(player5)
# chipmunks.add_player(player6)
# chipmunks.play(2)


# chipmunks.print_stats
# knuckleheads.print_stats
