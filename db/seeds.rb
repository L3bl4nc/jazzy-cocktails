require 'open-uri'
require 'json'

puts "Cleaning up database!"
Ingredient.destroy_all
puts "My database is clean!"

puts "Creating Ingredients"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read
ingredients = JSON.parse(json)
ingredients['drinks'].each do |ingredient|
  ingredient = Ingredient.create(name: ingredient["strIngredient1"])
  puts "The ingredient #{ingredient.name} was added."
end

puts "Ingredients Created!"