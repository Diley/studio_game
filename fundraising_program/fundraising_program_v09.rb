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

project1 = Project.new( 'parkav', 669, 900 );
project2 = Project.new( 'plate iq', 654, 1200 );
project3 = Project.new( 'bagaveev', 1128, 2200 );
project4 = Project.new( 'flaviar', 2912, 4200 );

projects = Array.new
projects.push( project1 )
projects.push( project2 )
projects.push( project3 )
projects.push( project4 )

puts "Ate o momento o programa conta com #{projects.length} projetos. Sao eles:"
puts "\n"
projects.each do |project|
	puts project
end

puts "\n" + "-------------------------------------------".center(50) + "\n\n"
projects.each do |project|
	project.remove_fund
	project.add_fund
	project.add_fund
	project.add_fund
	project.remove_fund
end

puts "\n" + "-------------------------------------------".center(50) + "\n\n"
# puts "\n\n"
puts "Apos uma semana conturbada com novos investimentos aplicados e outros removidos, os projetos do programa ficaram assim:"
puts "\n"
projects.each do |project|
	puts project
end


