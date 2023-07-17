class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :recipe
      t.integer :user_id
      t.integer :ingredient_id
      t.timestamps
    end
  end
end
