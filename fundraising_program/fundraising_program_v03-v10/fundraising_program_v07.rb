# Foundraising Program
# Dados baseados em https://wefunder.me/

class Project
	def initialize( name, funding, target_funding )
		@name = name
		@funding = funding
		@target_funding = target_funding
	end

	def to_s
		"O projeto #{@name.upcase} tem investimento acumulado de R$ #{@funding} de R$ #{@target_funding} desejados."
	end

	def add_fund
		@funding += 25
		puts "O projeto #{@name.upcase} recebeu mais fundos =D."
	end

	def remove_fund
		@funding -= 15
		puts "O projeto #{@name.upcase} perdeu alguns fundos =(."
	end
end

project1 = Project.new( 'parkav', 669, 900 );
project2 = Project.new( 'plate iq', 654, 1200 );
project3 = Project.new( 'bagaveev', 1128, 2200 );
project4 = Project.new( 'flaviar', 2912, 4200 );

puts project1
puts project2
puts project3
puts project4

project1.add_fund
project3.remove_fund
project2.add_fund

puts project1
puts project2
puts project3
puts project4

project4.add_fund
project2.remove_fund
project4.add_fund

