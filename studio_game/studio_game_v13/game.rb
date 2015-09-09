require_relative 'player'
require_relative 'die'

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
		@players.each do |player|
			die = Die.new
			number_rolled = die.roll

			case number_rolled
				when 1..2
					player.blam
				when 3..4
					puts "#{player.name} was skipped"
				else
					player.w00t
			end

			# if number_rolled >= 5
			# 	player.w00t
			# elsif number_rolled < 5 && number_rolled >=3
			# 	puts "#{player.name} was skipped"
			# elsif number_rolled <3
			# 	player.blam
			# end
		end

	end
end

