class Player
	include Comparable

	attr_reader :health
	attr_accessor :name

	def initialize(name, health=50)
		@name = name.capitalize
		@health = health
	end

	def strong?
		@health > 100
		# true
	end
	
	def to_s()
		"I'm #{@name} with a health of #{@health} and socre of #{score}."
	end

	def blam
		@health -= 10
		puts "#{@name} got blammed"
	end

	def w00t
		@health += 15
		puts "#{@name} got w00ted"
	end

	def score
		@health + @name.length
	end

	def name=(new_name)
		@name = new_name.capitalize
	end

	def <=>(other)
    	# score <=> anOther.score
    	other.score <=> score
    end
  # end
end

if __FILE__ == $0
	player = Player.new("moe")
	puts player.name
	puts player.health
	player.w00t
	puts player.health
	player.blam
	puts player.health
end