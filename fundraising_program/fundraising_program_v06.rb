# Foundraising Program
# Dados baseados em https://wefunder.me/

def print_project_funding( project, description, funding = 100000 )
	"O projeto #{project}, #{description}, recebeu um investimento de R$ #{funding}."
end

project1 = 'parkav'	
funding1 = 669000
description1 = 'projeto para encontrar locais de estacionamento com 95% de precisao'

project2 = 'plate iq'	
funding2 = 654000
description2 = 'plataforma de software que permite que restaurantes armazenem e gerenciem todos os pedidos e contas na nuvem e monitora seus lucros e prejuizos em tempo real'

description3 = 'corporacao de construcao de foguetes especificamente para lancar nanossatelites, 1 do tamanho de um foguete padrao ground-to-orbit. Promete lancar 50 foguetes por ano'
project3 = 'bagaveev'
funding3 = 1128600

description4 = 'projeto para que se possa descobrir e comprar bebidas spirit online'
project4 = 'flaviar'
funding4 = 2912200

puts print_project_funding( project1, description2, funding1 )
puts print_project_funding( project2, description2, funding2 )
puts print_project_funding( project3, description3, funding3 )
puts print_project_funding( project4, description4 )
