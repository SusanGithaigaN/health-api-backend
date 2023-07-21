class Recipe < ApplicationRecord
    has_many :ingredients
    has_many :user_recipes
    belongs_to :user
end
