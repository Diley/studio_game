# Foundraising Program
# Dados baseados em https://wefunder.me/

require_relative 'fundrequest'

project1 = Project.new( 'parkav', 669, 700 );
project2 = Project.new( 'plate iq', 654, 700 );
project3 = Project.new( 'bagaveev', 1128, 1600 );
project4 = Project.new( 'flaviar', 2912, 3400 );

fund_program1 = FundRequest.new("VC-Friendly Start-up Projects.")
fund_program1.add_project(project1)
fund_program1.add_project(project2)
fund_program1.add_project(project3)
fund_program1.add_project(project4)
fund_program1.request_funding(2)
fund_program1.print_stats
