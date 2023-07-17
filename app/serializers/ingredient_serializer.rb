class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :calories, :fat, :carbs, :protein
end
