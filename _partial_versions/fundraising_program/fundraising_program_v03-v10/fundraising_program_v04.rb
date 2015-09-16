# Foundraising Program
# Dados baseados em https://wefunder.me/

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

puts "\n#{project1.capitalize} teve investimento de #{funding1}."
puts "\n#{project2.upcase} teve investimento de #{funding2}."
puts "\n" + "#{project3.capitalize} teve investimento de #{funding3}".center(80,'- * ')
puts "\n" + "#{project4.upcase} teve investimento de #{funding4}.".rjust(70)

