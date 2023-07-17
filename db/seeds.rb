# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts '👤 Seeding Admin...'
Admin.create(
  name: 'Susan Githaiga',
  username: 'admin',
  email: 'susangithaiga26@gmail.com',
  password: 'admin'
)
puts '💃 Seeding Admin done !!!...'

# seeding users
puts '🌱 Seeding users...'
User.create(
    name: 'Pete',
    age: 22,
    height: '1.5m',
    email: 'pete@gmail.com',
    password: '123456',
    username: 'pete_pan',
    recipe: 'pancake'
)
puts '💃 Seeding User done !!!...'

# seeding recipes
puts '🧑‍🍳 Seeding recipes...'
Recipe.create(
  recipe: 'pancake',
  user_id: 1,
  ingredient_id: 1
)
puts '💃 Seeding Recipes done !!!...'


# seeding ingredients
puts '🍲 Seeding Ingredients...'
Ingredient.create(
  recipe_id: 1,
  calories: 142,
  fat: '0.789',
  carbs: '.5g',
  protein:'3g'
)

puts '💃 Seeding ingredients done !!!...'

# user's recipes
puts '🍲 Seeding user recipes...'
UserRecipe.create(
  user_id: 1,
  recipe_id: 1
)
puts '💃 Seeding User Recipes done !!!...'