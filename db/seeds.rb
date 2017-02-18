
require 'open-uri'
require 'json'

Cocktail.destroy_all
Ingredient.destroy_all



ingredients_url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
doc = open(ingredients_url).read
json = JSON.parse(doc)

json['drinks'].each do |ingredient|
  Ingredient.create! name: ingredient["strIngredient1"]
end

