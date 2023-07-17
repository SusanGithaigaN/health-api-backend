json.extract! user_recipe, :id, :created_at, :updated_at
json.url user_recipe_url(user_recipe, format: :json)
