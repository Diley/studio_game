# Foundraising Program
# Dados baseados em https://wefunder.me/

class Project
	attr_reader :funding, :target_funding
	attr_accessor :name

	def initialize( name, funding, target_funding )
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
end

class FundraisingProgram
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

project1 = Project.new( 'parkav', 669, 900 );
project2 = Project.new( 'plate iq', 654, 1200 );
project3 = Project.new( 'bagaveev', 1128, 2200 );
project4 = Project.new( 'flaviar', 2912, 4200 );

fund_program1 = FundraisingProgram.new("VC-Friendly Start-up Projects.")
fund_program1.add_project(project1)
fund_program1.add_project(project2)
fund_program1.add_project(project3)
fund_program1.add_project(project4)
fund_program1.request_funding
