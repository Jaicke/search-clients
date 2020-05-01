import time
from search import Search

item = int(input("> Item que você deseja pesquisar: "))

print(" 1- Busca Sequencial\n 2- Busca Binária")
search_type = int(input("> Tipo de busca você deseja utilizar: "))

print(" 1- MongoDb\n 2- Mysql\n 3- Postgresql\n 4- SQLserver")
database = int(input("> Banco de dados onde serão consultados os itens: "))


s = Search(item, database)

print("Um momento...")

start = time.time()
found = s.call(search_type)
end = time.time()

exec_time = end - start

if found:
	print("Item encontrado em {}sec".format(exec_time))
else:
	print("Item não encontrado!!")
