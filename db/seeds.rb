require 'open-uri'
require 'json'

puts "Cleaning up database!"
Ingredient.destroy_all
puts "My database is clean!"

puts "Creating Ingredients"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read
ingredients = JSON.parse(json) 
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient)
end

puts "Ingredients Created!"