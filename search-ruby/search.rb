require 'net/http'
require 'json'

class Search
  URL = "https://n-random-api.herokuapp.com/get_numbers?db="

  DATABASES = {
    1 => 'MongoDb',
    2 => 'Mysql',
    3 => 'Postgresql',
    4 => 'SQLserver'
  }

	def initialize(item, database)
    @searched_item = item
    @database = DATABASES[database].downcase
    @itens  = itens
  end

  def self.call!(item, search_type, database)
    new(item, database).send("#{search_type}_search!")
  end

  def sequential_search!
    @itens.each do |item|
      return true if item == @searched_item
    end
    false
  end

  def binary_search!
    @itens.sort.bsearch { |item| @searched_item <=> item }
  end

  private

  def itens
    uri = URI(URL + @database)
    res = JSON.parse(Net::HTTP.get(uri))
    res['numbers']
  end

end