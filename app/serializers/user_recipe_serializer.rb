class UserRecipeSerializer < ActiveModel::Serializer
  attributes :user_id, :recipe_id
  belongs_to :user
  belongs_to :recipe
  # has_many :ingredients
end
