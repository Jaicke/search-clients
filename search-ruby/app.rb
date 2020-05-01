require 'benchmark'
require './search.rb'

print "> Item que você deseja pesquisar: "
item = gets.chomp.to_i

puts " 1- Busca Sequencial\n 2- Busca Binária"
print "> Tipo de busca você deseja utilizar: "
search_type = gets.chomp.to_i

Search::DATABASES.each { |key, value| p " #{key}- #{value}"}
print "> Banco de dados onde serão consultados os itens: "
database = gets.chomp.to_i

raise "Tipo de busca inválido..." unless [1, 2].include?(search_type)
raise "Banco de dados inválido..." unless [1, 2, 3, 4].include?(database)

puts "Um momento..."

time = Benchmark.realtime { $found = Search.call!(item, 'sequential', database) } if search_type == 1
time = Benchmark.realtime { $found = Search.call!(item, 'binary', database) } if search_type == 2


puts "Item encontrado em #{time}sec" if $found
puts "Item não encontrado!" unless $found