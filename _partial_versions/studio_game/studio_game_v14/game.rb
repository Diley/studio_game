require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

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
			GameTurn.take_turn(player)

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

