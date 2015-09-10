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

	def request_funding(rounds)
		1.upto(rounds) do |round|
			puts "\nRequest Funding on Round: #{round}"
			@projects.each do |project|
				FundingRound.take_turn(project)
			end
		end
	end

	def print_project_stats(project)
		"#{project.name}".ljust(30, '.') + "#{project.funding}".ljust(9,'.') + "#{project.target_funding}".ljust(9,'.') 
	end

	def print_project_funding_left(project)
		"#{project.name}".ljust(30, '.') + "#{project.funding_left}"
	end

	def print_stats
		puts "\nStats for #{@title}"
		fully_funded, under_funded = @projects.partition { |project| project.fully_funded? }

		puts "\nFully funded projecs:"
		fully_funded.each { |project| puts print_project_stats(project) }

		puts "\nUnder funded projecs:"
		under_funded.each { |project| puts print_project_stats(project) }

		puts "\nProjects with more fundings left"
		under_funded.sort.each { |project| puts print_project_funding_left(project) }
		# @projects.sort.each { |project| puts print_project_funding_left(project) unless project.fully_funded? }
	end

end