require_relative 'project'
require_relative 'die'

class FundRequest
	attr_accessor :name
	
	def initialize(name)
		@name = name
		@projects = []
	end

	def add_project(project)
		@projects << project
	end

	def request_funding
		@projects.each do |project|
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
end