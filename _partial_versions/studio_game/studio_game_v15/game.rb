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

	def play(rounds)
		puts "\n\n#{@title}'s game"
		1.upto(rounds) do |round|
			puts "\nNew round: #{round}"
			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
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
		
		puts "\n\n#{@title}'s High Scores"
		@players.sort.each do |player|
			puts print_name_and_health(player)
		end
	end

end

