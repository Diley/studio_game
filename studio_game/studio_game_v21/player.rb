require_relative 'treasure_trove'
require_relative 'playable'

class Player
	include Playable
	include Comparable

	attr_reader  :found_treasures
	attr_accessor :name, :health

	def initialize(name, health=50)
		@name = name.capitalize
		@health = health
		@found_treasures = Hash.new(0)
	end

	def self.from_csv(line)
		name, health = line.split(',')
		Player.new(name, Integer(health))
	end

	def each_found_treasure
		@found_treasures.each do |name, points|
			treasure = Treasure.new(name,points)
			yield treasure
		end
	end

	def found_treasure(treasure)
		@found_treasures[treasure.name] += treasure.points
		puts "#{@name} found a #{treasure.name} worth #{treasure.points} points"
		puts "#{@name}'s treasures: #{@found_treasures}"
	end

	def points
		@found_treasures.values.reduce(0, :+)
	end

	
	
	def to_s
		"I'm #{@name} with a health of #{@health}, points = #{points}, and score of = #{score}."
	end

	def score
		@health + points
		# @health + @name.length
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
