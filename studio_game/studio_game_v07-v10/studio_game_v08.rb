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

player1 = Player.new("moe", 100)
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

puts player1.name
puts player1.health
puts player2.name
puts player2.health
puts player3.name
puts player3.health

player2.name = "lawrance"
puts player2.name

puts player1
puts player2
puts player3
