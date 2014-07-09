class RemoveCategoryIdFromIngredients < ActiveRecord::Migration
  def up
    remove_column :ingredients, :category_id, :integer, null: false
  end

  def down
    add_column :ingredients, :category_id, :integer, null: false
  end
end
