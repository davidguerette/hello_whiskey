class AddCategoryIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :category_id, :integer, null: false
  end
end
