require_relative 'pledge_pool'

class Project
	attr_reader :funding, :target_funding, :pledges_accumulated
	attr_accessor :name

	def initialize( name, funding = 0, target_funding = 1000 )
		@name = name.capitalize
		@funding = funding
		@target_funding = target_funding
		@pledges_accumulated = Hash.new(0)
	end

	def self.from_csv(line)
		name, funding, target_funding = line.split(',')
		Project.new(name, Integer(funding), Integer(target_funding))
	end

	def each_pledge
		@pledges_accumulated.each do |name, amount|
			pledge = Pledge.new(name,amount)
			yield pledge
		end
	end

	def to_s
		"O projeto #{@name.upcase} tem investimento acumulado de R$ #{@funding} de R$ #{@target_funding} desejados. Faltam R$ #{funding_left} para o objetivo ser alcancado!"
	end

	def add_fund
		@funding += 25
		puts "O projeto #{@name.upcase} recebeu mais fundos =D."
	end

	def remove_fund
		@funding -= 15
		puts "O projeto #{@name.upcase} perdeu alguns fundos =(."
	end

	def funding_left
		target_funding - total_funds
	end

	def name=(new_name)
		@name = new_name.capitalize
	end

	def fully_funded?
		total_funds >= target_funding
	end

	def <=>(other)
		other.funding_left <=> funding_left
	end

	def add_pledge(pledge)
		@pledges_accumulated[pledge.name] += pledge.amount
	end

	def total_funds
		@funding + pledges_amount
	end

	def pledges_amount
		@pledges_accumulated.values.reduce(0, :+)
	end

end