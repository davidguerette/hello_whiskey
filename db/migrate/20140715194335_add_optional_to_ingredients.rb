class AddOptionalToIngredients < ActiveRecord::Migration
  def up
    add_column :ingredients, :optional, :boolean, default: false
  end

  def down
    remove_column :ingredients, :optional
  end
end
