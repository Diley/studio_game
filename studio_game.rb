class Player
	def initialize(name, health)
		@name = name.capitalize
		@health = health
	end
	
	def to_s()
		"I'm #{@name.capitalize} with a health of #{@health}"
	end

	def blam
		@health -= 10
	end

	def w00t
		@health += 15
		puts "Player got w00ted"
	end


end

player1 = Player.new("moe", 100)
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

player3.blam
puts player3
player3.w00t
puts player3

# puts player1.inspect

# puts say_hello("moe")
# puts say_hello("shemp", 90)

# puts new_time

# puts say_hello