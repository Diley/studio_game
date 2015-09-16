require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(player)
		@players << player
	end

	def play(rounds)
		puts "\n\n#{@title}'s game"

		treasures = TreasureTrove::TREASURES
		puts "\nThere are #{treasures.size} treasures to be found:"
		treasures.each do |treasure|
			puts "A #{treasure.name} is worth #{treasure.points}"
		end

		1.upto(rounds) do |round|
			puts "\nNew round: #{round}"
			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
			end
			puts "Points at the end of the #{round}round: #{total_points}"
			if yield
				break
			end
		end
	end

	def print_name_and_health(player)
		"#{player.name}".ljust(20, '.') + "#{player.score}"
		# "#{player.score}".ljust(20, '.') + "#{player.name}"
	end

	def print_stats
		puts "\n\n#{@title}'s Stats"
		strongs, wimpies = @players.partition{ |player| player.strong? }
		# strongs.sort.reverse!

		puts "\n#{strongs.length} strong player:"
		strongs.each { |player| puts "#{player.name} (#{player.health})" }

		puts "\n#{wimpies.length} wimpy player:"
		wimpies.each { |player| puts "#{player.name} (#{player.health})" }

		# sorted_players = @players.sort_by { |player| player.score } .reverse
		# sorted_players = @players.sort { |x,y| y.score <=> x.score }
		@players.each do |player|
			puts "\n#{player.name}'s points totals:"
			player.each_found_treasure do | treasure |
				puts "#{treasure.points} total #{treasure.name} points"
			end
			puts "#{player.points} grand total points"
		end

		puts "\n\n#{@title}'s High Scores"
		@players.sort.each do |player|
			puts print_name_and_health(player)
		end
	end

	def total_points
		@players.reduce(0) { |sum, player| sum + player.points }
	end

end

