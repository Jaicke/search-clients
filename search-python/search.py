import urllib.request
import json

class Search:
  def __init__(self, item, database):
    self.item = item
    self.database = database
    self.url = "http://n-random-api.herokuapp.com/get_numbers?db="
    self.databases = { 1: 'mongodb', 2: 'mysql', 3: 'postgresql', 4: 'sqlserver' }

  def call(self, search_type):
    self.set_itens()
    if search_type == 1:
      return self.sequential_search()
    else:
      return self.binary_search(self.itens)


  def sequential_search(self):
    position = 0

    while position < len(self.itens):
      if self.itens[position] == self.item:
        return True
      position = position + 1

    return False

  def binary_search(self, itens):
    itens.sort()
    if not itens:
      return False
    midpoint = len(itens) // 2
    if itens[midpoint] == self.item:
      return True
    if self.item < itens[midpoint]:
      return self.binary_search(itens[:midpoint])
    return self.binary_search(itens[midpoint + 1:])


  def set_itens(self):
    content = urllib.request.urlopen(self.url + self.databases[self.database])
    res = json.loads(content.read())
    self.itens = res['numbers']