require 'json'
require 'open-uri'

p 'cleaning Ingredient...'
Ingredient.destroy_all
p 'scraping Ingredient..'
url = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
data = JSON.parse(url, opts = {symbolize_names: true})
p 'creating Ingredients'
data.first[1].each do |ingredient|
  Ingredient.create(name: ingredient[:strIngredient1])
end
p "Success ! #{Ingredient.count} ingredients created"
