class AddOptionalToIngredients < ActiveRecord::Migration
  def up
    add_column :ingredients, :optional, :boolean, default: true
  end

  def down
    remove_column :ingredients, :optional
  end
end
