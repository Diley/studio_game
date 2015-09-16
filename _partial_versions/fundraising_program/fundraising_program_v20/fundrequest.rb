require_relative 'project'
require_relative 'die'
require_relative 'funding_round'
require_relative 'pledge_pool'

class FundRequest
	attr_accessor :name
	
	def initialize(name)
		@name = name
		@projects = []
	end

	def load_projects(from_file)
		File.readlines(from_file).each do |line|
			add_project(Project.from_csv(line))
		end 
	end

	def save_under_funded_projects(to_file)
		File.open(to_file, "w") do |file|
			file.puts "Under funded projecs:"
			under_funded_projects.each do |project|
				file.puts print_project_stats(project) 
				# file << print_project_stats(project) 
			end
		end
	end

	def add_project(project)
		@projects << project
	end

	def request_funding(rounds)
		pledges = PledgePool::PLEDGES
		puts "There are #{pledges.size} pledges:"
		pledges.each do |pledge|
			puts "\tA #{pledge.name} plage is worth #{pledge.amount}"
		end

		1.upto(rounds) do |round|
			puts "\nRequest Funding on Round: #{round}"
			@projects.each do |project|
				FundingRound.take_turn(project)
			end
		end
	end

	def print_project_stats(project)
		"#{project.name}".ljust(30, '.') + "#{project.funding}".ljust(9,'.') + "#{project.target_funding}"
	end

	def print_project_funding_left(project)
		"#{project.name}".ljust(30, '.') + "#{project.funding_left}"
	end

	def under_funded_projects
		under_funded = @projects.reject { |project| project.fully_funded? }
	end

	def fully_funded_projects
		@projects.select { |project| project.fully_funded? }
	end

	def print_stats
		puts "\nStats for #{@name}"
		# fully_funded, under_funded = @projects.partition { |project| project.fully_funded? }
		
		fully_funded = fully_funded_projects
		under_funded = under_funded_projects

		puts "\nFully funded projecs:"
		fully_funded.each { |project| puts print_project_stats(project) }

		puts "\nUnder funded projecs:"
		under_funded.each { |project| puts print_project_stats(project) }

		puts "\nProjects with more fundings left"
		under_funded.sort.each { |project| puts print_project_funding_left(project) }

		@projects.each do |project|
			puts "\nProject #{project.name} pledges:"
			project.each_pledge do |pledge|
				puts "$#{pledge.amount} in #{pledge.name} pledges"
			end
			puts "$#{project.pledges_amount} in total pledges"
		end

		# @projects.sort.each { |project| puts print_project_funding_left(project) unless project.fully_funded? }
	end

	# def print_project_stats(project)
	# 	puts "#{project.name}".ljust(30,'.') + "#{project.funding_left}"
	# end

	def total_pledges_amount
		@projects.each.reduce(0) { |sum, project| sum += project.pledges_amount }
	end

end