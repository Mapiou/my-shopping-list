# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "########## Cleaning database... ##########"
ShoppingList.destroy_all
Dose.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
User.destroy_all
puts "########## Database cleaned! ##########"

puts "########## Creating users... ##########"
example = User.create!(email: ENV['EXAMPLE_EMAIL'], password: ENV['EXAMPLE_PWD'])
puts "########## Users created! ##########"

puts "########## Creating recipes... ##########"
recipes = [
  {
    name: "Nouilles udon au poulet, sauce & noix de cajou",
    photo: "s49-nouilles-udon-au-poulet-sauce-sucree-et-noix-de-cajou.jpg",
    cooking_time: 20,
    week_nb: 49,
    season: "Hiver",
    category: "Viande blanche"
  },
  {
    name: "Pizza bianca aux champignons poêlés",
    photo: "s49-pizza-bianca-aux-champignons-poeles.jpg",
    cooking_time: 25,
    week_nb: 49,
    season: "Hiver",
    category: "Végétarien"
  },
  {
    name: "Cabillaud à la meunière et sauce au beurre & câpres",
    photo: "s49-cabillaud-a-la-meuniere-et-sauce-au-beurre-capres.jpg",
    cooking_time: 40,
    week_nb: 49,
    season: "Hiver",
    category: "Poisson"
  },
  {
    name: "Steak haché et purée de patate douce épicée",
    photo: "s49-steak-hache-et-puree-de-patate-douce-epicee.jpg",
    cooking_time: 30,
    week_nb: 49,
    season: "Hiver",
    category: "Viande rouge"
  },
  {
    name: "Farfalle & pesto aux champignons des bois",
    photo: "s49-farfalle-pesto-aux-champignons-des-bois.jpg",
    cooking_time: 20,
    week_nb: 49,
    season: "Hiver",
    category: "Végétarien"
  }
]

recipes.each do |attributes|
  recipe = Recipe.new(attributes)
  filepath = File.join(Rails.root, 'db', 'data', attributes[:photo])
  recipe.photo.attach(io: File.open(filepath),
                      filename: attributes[:photo],
                      content_type: 'image/jpg')
  recipe.user = example
  recipe.save!
  puts "Created #{recipe.name}"
end
puts "########## Recipes created! ##########"

puts "########## Creating ingredients... ##########"
filepath = File.join(Rails.root, 'db', 'data', 'ingredients.json')
serialized_ingredients = File.read(filepath)
ingredients = JSON.parse(serialized_ingredients)

ingredients.each do |attributes|
  ingredient = Ingredient.new(attributes)
  ingredient.user = example
  ingredient.save!
  puts "Created #{ingredient.name}"
end
puts "########## Ingredients created! ##########"

puts "########## Creating doses... ##########"
puts "########## Recipe #1 - Nouilles udon au poulet, sauce & noix de cajou ##########"
recipe = Recipe.find_by(name: recipes[0][:name])
puts "############################## #{recipe.name}"
doses = [
  {
    name: "Champignons de Paris",
    quantity: 125,
    unit: "g"
  },
  {
    name: "Oignon nouveau",
    quantity: 1.5,
    unit: "pièce"
  },
  {
    name: "Gousse d'ail",
    quantity: 0.5,
    unit: "pièce"
  },
  {
    name: "Gingembre frais",
    quantity: 1,
    unit: "cm"
  },
  {
    name: "Concombre",
    quantity: 0.25,
    unit: "pièce"
  },
  {
    name: "Dés de filet de poulet",
    quantity: 100,
    unit: "g"
  },
  {
    name: "Nouilles udon fraîches",
    quantity: 200,
    unit: "g"
  },
  {
    name: "Noix de cajou",
    quantity: 5,
    unit: "g"
  },
  {
    name: "Sauce asiatique douce",
    quantity: 35,
    unit: "g"
  }
]

doses.each do |attributes|
  ingredient = Ingredient.find_by(name: attributes[:name])
  Dose.create!(
    recipe: recipe,
    ingredient: ingredient,
    quantity: attributes[:quantity],
    unit: attributes[:unit]
  )
end
puts "########## Doses for recipe #1 created! ##########"

puts "########## Recipe #2 - Pizza bianca aux champignons poêlés ##########"
recipe = Recipe.find_by(name: recipes[1][:name])
doses = [
  {
    name: "Champignons de Paris",
    quantity: 125,
    unit: "g"
  },
  {
    name: "Gousse d'ail",
    quantity: 1,
    unit: "pièce"
  },
  {
    name: "Oignon rouge",
    quantity: 0.5,
    unit: "pièce"
  },
  {
    name: "Mozzarella di Bufala",
    quantity: 62.5,
    unit: "g"
  },
  {
    name: "Pain naan",
    quantity: 1,
    unit: "pièce"
  },
  {
    name: "Fromage italien râpé",
    quantity: 25,
    unit: "g"
  },
  {
    name: "Origan séché",
    quantity: 1,
    unit: "cc"
  },
  {
    name: "Mesclun",
    quantity: 30,
    unit: "g"
  }
]

doses.each do |attributes|
  ingredient = Ingredient.find_by(name: attributes[:name])
  Dose.create!(
    recipe: recipe,
    ingredient: ingredient,
    quantity: attributes[:quantity],
    unit: attributes[:unit]
  )
end
puts "########## Doses for recipe #2 created! ##########"

puts "########## Recipe #3 - Cabillaud à la meunière et sauce au beurre & câpres ##########"
recipe = Recipe.find_by(name: recipes[2][:name])
doses = [
  {
    name: "Pommes de terre à chair fondante",
    quantity: 250,
    unit: "g"
  },
  {
    name: "Poireau",
    quantity: 0.5,
    unit: "pièce"
  },
  {
    name: "Haricots verts",
    quantity: 75,
    unit: "g"
  },
  {
    name: "Échalote",
    quantity: 0.5,
    unit: "pièce"
  },
  {
    name: "Gousse d'ail",
    quantity: 0.5,
    unit: "pièce"
  },
  {
    name: "Citron vert",
    quantity: 0.25,
    unit: "pièce"
  },
  {
    name: "Persil plat frais",
    quantity: 5,
    unit: "g"
  },
  {
    name: "Filet de cabillaud",
    quantity: 1,
    unit: "pièce"
  },
  {
    name: "Câpres",
    quantity: 10,
    unit: "g"
  }
]

doses.each do |attributes|
  ingredient = Ingredient.find_by(name: attributes[:name])
  Dose.create!(
    recipe: recipe,
    ingredient: ingredient,
    quantity: attributes[:quantity],
    unit: attributes[:unit]
  )
end
puts "########## Doses for recipe #3 created! ##########"

puts "########## Recipe #4 - Steak haché et purée de patate douce épicée ##########"
recipe = Recipe.find_by(name: recipes[3][:name])
doses = [
  {
    name: "Patates douces",
    quantity: 250,
    unit: "g"
  },
  {
    name: "Pommes de terre à chair farineuse",
    quantity: 100,
    unit: "g"
  },
  {
    name: "Gousse d'ail",
    quantity: 0.5,
    unit: "pièce"
  },
  {
    name: "Piment rouge",
    quantity: 0.5,
    unit: "pièce"
  },
  {
    name: "Oignon nouveau",
    quantity: 2,
    unit: "pièce"
  },
  {
    name: "Haricots verts",
    quantity: 150,
    unit: "g"
  },
  {
    name: "Graines de courge",
    quantity: 5,
    unit: "g"
  },
  {
    name: "Viande de bœuf hachée",
    quantity: 1,
    unit: "pièce"
  },
  {
    name: "Paprika en poudre",
    quantity: 0.75,
    unit: "cc"
  }
]

doses.each do |attributes|
  ingredient = Ingredient.find_by(name: attributes[:name])
  Dose.create!(
    recipe: recipe,
    ingredient: ingredient,
    quantity: attributes[:quantity],
    unit: attributes[:unit]
  )
end
puts "########## Doses for recipe #4 created! ##########"

puts "########## Recipe #5 - Farfalle & pesto aux champignons des bois ##########"
recipe = Recipe.find_by(name: recipes[4][:name])
doses = [
  {
    name: "Farfalle",
    quantity: 90,
    unit: "g"
  },
  {
    name: "Échalote",
    quantity: 0.5,
    unit: "pièce"
  },
  {
    name: "Champignons de Paris",
    quantity: 125,
    unit: "g"
  },
  {
    name: "Pesto aux champignons des bois",
    quantity: 40,
    unit: "g"
  },
  {
    name: "Mâche",
    quantity: 20,
    unit: "g"
  },
  {
    name: "Persil frisé frais",
    quantity: 2.5,
    unit: "g"
  },
  {
    name: "Pecorino râpé",
    quantity: 12.5,
    unit: "g"
  }
]

doses.each do |attributes|
  ingredient = Ingredient.find_by(name: attributes[:name])
  Dose.create!(
    recipe: recipe,
    ingredient: ingredient,
    quantity: attributes[:quantity],
    unit: attributes[:unit]
  )
end
puts "########## Doses for recipe #5 created! ##########"
puts "########## Doses created! ##########"
