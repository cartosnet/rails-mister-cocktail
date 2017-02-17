
require 'open-uri'
require 'json'

Cocktail.destroy_all
Ingredient.destroy_all

bloody = Cocktail.create!(name: 'Bloody Mary')
mojito = Cocktail.create!(name: 'Mojito')

ingredients_url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
doc = open(ingredients_url).read
json = JSON.parse(doc)

json['drinks'].each do |ingredient|
  Ingredient.create! name: ingredient["strIngredient1"]
end


descriptions = ['3cl', '10gr', '3 cubes', '5 leaves']

4.times do
  bloody.doses.create(description: descriptions.sample, ingredient: Ingredient.all.sample) #cocktail_id is already added
  mojito.doses.create(description: descriptions.sample, ingredient: Ingredient.all.sample) #cocktail_id is already added
end
