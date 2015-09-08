class Player
	attr_reader :health
	attr_accessor :name

	def initialize(name, health)
		@name = name.capitalize
		@health = health
	end
	
	def to_s()
		"I'm #{@name.capitalize} with a health of #{@health} and socre of #{score}."
	end

	def blam
		@health -= 10
	end

	def w00t
		@health += 15
		puts "Player got w00ted"
	end

	def score
		@health + @name.length
	end

	def name=(new_name)
		@name = new_name.capitalize
	end
end


class Game
	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(player)
		@players << player
	end

	def play
		puts "There are #{@players.size} players in #{@title}"

		@players.each do |player|
			puts player
		end

		# Exercicio 3.2
		@players.each do |player|
			player.blam
			player.w00t
			player.w00t
			puts player
		end
	end
end

player1 = Player.new("moe", 100)
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

# Another game
chipmunks = Game.new("Chipmunks")
player4 = Player.new("alvin", 90)
player5 = Player.new("simon", 90)
player6 = Player.new("theodore", 95)

chipmunks = Game.new("Knuckleheads")
chipmunks.add_player(player4)
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.play


# Exercicio 2
# players = [player1, player2, player3]

# puts "There are #{players.size} players in the game"

# players.each do |player|
# 	puts player
# end

# # Exercicio 3.1
# players.each do |player|
# 	puts player.health
# end

# # Exercicio 3.2
# players.each do |player|
# 	player.blam
# 	player.w00t
# 	player.w00t
# 	puts player
# end

# # Exercicio 3.3
# players.pop
# players.push( Player.new("shemp", 90) )

# players.each do |player|
# 	puts player.health
# end
