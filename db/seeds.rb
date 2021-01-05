# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "########## Cleaning database... ##########"
Dose.destroy_all
ShoppingList.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
puts "########## Database cleaned! ##########"

puts "########## Creating recipes... ##########"
recipes = [
  {
    name: "Nouilles udon au poulet, sauce & noix de cajou",
    photo: "s49-nouilles-udon-au-poulet-sauce-sucree-et-noix-de-cajou.jpg",
    cooking_time: 20,
    week_nb: 49,
    season: "Hiver",
    category: "Viande"
  },
  {
    name: "Pizza bianca aux champignons poêlés",
    photo: "s49-pizza-bianca-aux-champignons-poeles.jpg",
    cooking_time: 25,
    week_nb: 49,
    season: "Hiver",
    category: "Végétarien"
  }
]

recipes.each do |attributes|
  recipe = Recipe.create!(attributes)
  puts "Created #{recipe.name}"
end
puts "########## Recipes created! ##########"

puts "########## Creating ingredients... ##########"
ingredients = [
  {
    name: "Champignons de Paris",
    section: "Maraîcher"
  },
  {
    name: "Oignon nouveau",
    section: "Maraîcher"
  },
  {
    name: "Gousse d'ail",
    section: "Maraîcher"
  },
  {
    name: "Gingembre frais",
    section: "Maraîcher"
  },
  {
    name: "Concombre",
    section: "Maraîcher"
  },
  {
    name: "Dés de poulet",
    section: "Boucherie"
  },
  {
    name: "Nouilles udon fraîches",
    section: "Epicerie"
  },
  {
    name: "Noix de cajou",
    section: "Epicerie"
  },
  {
    name: "Sauce asiatique douce",
    section: "Epicerie"
  },
  {
    name: "Oignon rouge",
    section: "Maraîcher"
  },
  {
    name: "Mesclun",
    section: "Maraîcher"
  },
  {
    name: "Mozzarella di Bufala",
    section: "Fromagerie"
  },
  {
    name: "Fromage italien râpé",
    section: "Fromagerie"
  },
  {
    name: "Origan séché",
    section: "Epicerie"
  },
  {
    name: "Pain naan",
    section: "Epicerie"
  }
]

ingredients.each do |attributes|
  ingredient = Ingredient.create!(attributes)
  puts "Created #{ingredient.name}"
end
puts "########## Ingredients created! ##########"

puts "########## Creating doses... ##########"
puts "########## Recipe #1 - Nouilles udon au poulet, sauce & noix de cajou ##########"
recipe = Recipe.find_by(name: recipes[0][:name])
ingredients = [
  {
    name: "Champignons de Paris",
    quantity: 250,
    unit: "g"
  },
  {
    name: "Oignon nouveau",
    quantity: 3,
    unit: "pièce"
  },
  {
    name: "Gousse d'ail",
    quantity: 1,
    unit: "pièce"
  },
  {
    name: "Gingembre frais",
    quantity: 2,
    unit: "cm"
  },
  {
    name: "Concombre",
    quantity: 0.5,
    unit: "pièce"
  },
  {
    name: "Dés de poulet",
    quantity: 200,
    unit: "g"
  },
  {
    name: "Nouilles udon fraîches",
    quantity: 400,
    unit: "g"
  },
  {
    name: "Noix de cajou",
    quantity: 10,
    unit: "g"
  },
  {
    name: "Sauce asiatique douce",
    quantity: 70,
    unit: "g"
  }
]

ingredients.each do |attributes|
  ingredient = Ingredient.find_by(name: attributes[:name])
  Dose.create!(
    recipe_id: recipe.id,
    ingredient_id: ingredient.id,
    quantity: attributes[:quantity],
    unit: attributes[:unit]
  )
end
puts "########## Doses for recipe #1 created! ##########"

puts "########## Recipe #2 - Pizza bianca aux champignons poêlés ##########"
recipe = Recipe.find_by(name: recipes[1][:name])
ingredients = [
  {
    name: "Champignons de Paris",
    quantity: 250,
    unit: "g"
  },
  {
    name: "Gousse d'ail",
    quantity: 2,
    unit: "pièce"
  },
  {
    name: "Oignon rouge",
    quantity: 1,
    unit: "pièce"
  },
  {
    name: "Mozzarella di Bufala",
    quantity: 125,
    unit: "g"
  },
  {
    name: "Pain naan",
    quantity: 2,
    unit: "pièce"
  },
  {
    name: "Fromage italien râpé",
    quantity: 50,
    unit: "g"
  },
  {
    name: "Origan séché",
    quantity: 2,
    unit: "cc"
  },
  {
    name: "Mesclun",
    quantity: 60,
    unit: "g"
  }
]

ingredients.each do |attributes|
  ingredient = Ingredient.find_by(name: attributes[:name])
  Dose.create!(
    recipe_id: recipe.id,
    ingredient_id: ingredient.id,
    quantity: attributes[:quantity],
    unit: attributes[:unit]
  )
end
puts "########## Doses for recipe #2 created! ##########"
puts "########## Doses created! ##########"
