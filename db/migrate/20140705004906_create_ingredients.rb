class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.float :quantity
      t.string :unit
      t.integer :component_id, null: false
      t.integer :recipe_id, null: false
    end
  end
end
