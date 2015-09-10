class Project
	attr_reader :funding, :target_funding
	attr_accessor :name

	def initialize( name, funding = 0, target_funding = 1000 )
		@name = name.capitalize
		@funding = funding
		@target_funding = target_funding
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
		target_funding - funding
	end

	def name=(new_name)
		@name = new_name.capitalize
	end

	def fully_funded?
		funding >= target_funding
	end

	def <=>(other)
		other.funding_left <=> funding_left
	end
end