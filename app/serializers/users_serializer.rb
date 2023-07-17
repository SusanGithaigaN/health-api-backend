class UsersSerializer < ActiveModel::Serializer
  attributes :name, :age, :height, :email
  has_many :recipes
end
