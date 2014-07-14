class CreateSubstitutions < ActiveRecord::Migration
  def change
    create_table :substitutions do |t|
      t.integer :ingredient_id
      t.integer :substitute_id
    end
  end
end
