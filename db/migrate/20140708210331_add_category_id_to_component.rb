class AddCategoryIdToComponent < ActiveRecord::Migration
  def change
    add_column :components, :category_id, :integer, null: false
  end
end
