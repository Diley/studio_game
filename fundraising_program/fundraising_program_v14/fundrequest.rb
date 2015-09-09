require_relative 'project'
require_relative 'die'
require_relative 'funding_round'

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
			FundingRound.take_turn(project)
		end
	end
end