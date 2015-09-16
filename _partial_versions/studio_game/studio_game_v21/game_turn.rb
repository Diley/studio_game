require_relative 'game'
require_relative 'die'
require_relative 'loaded_die'
require_relative 'treasure_trove'

module GameTurn
	def self.take_turn(player)
		puts "\nPlayer turn: #{player.name}"
		die = Die.new
		number_rolled = die.number

		puts "number_rolled: #{number_rolled}"

		case number_rolled
			when 1..2
				player.blam
			when 3..4
				puts "#{player.name} was skipped"
			else
				player.w00t
		end

		treasure = TreasureTrove::random
		# puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points"
		player.found_treasure(treasure)
	end


end