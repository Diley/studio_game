require_relative 'project'

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
			project.remove_fund
			project.add_fund
			project.add_fund
			project.add_fund
			project.remove_fund
		end
	end
end