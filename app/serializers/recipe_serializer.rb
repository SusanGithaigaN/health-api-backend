class RecipeSerializer < ActiveModel::Serializer
  attributes :recipe
  # only display user's name
  # belongs_to :user
  has_many :ingredients

end