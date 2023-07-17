class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.integer :calories
      t.string :fat
      t.string :carbs
      t.string :protein
      t.timestamps
    end
  end
end
