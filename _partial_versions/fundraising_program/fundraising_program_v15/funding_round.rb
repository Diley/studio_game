require_relative 'project'
require_relative 'die'

module FundingRound
	def self.take_turn(project)
		die = Die.new
		number_rolled = die.roll 
		case number_rolled
		when 1..2
			project.add_fund
		when 3
			puts "#{project.name} skipped"
		when 4..5 
			project.remove_fund
		end
	end
end