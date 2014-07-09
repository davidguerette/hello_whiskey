CSV.foreach("../holy_grail/db/data/hello_whiskey_seeder.csv", headers: true, header_converters: :symbol) do |row|
  row = row.to_hash

  recipe = Recipe.find_or_create_by({name: row[:recipe_name], directions: row[:recipe_directions]})
  category = Category.find_or_create_by({name: row[:category_name]})
  component = Component.find_or_create_by({name: row[:component_name], category_id: category.id})
  Ingredient.find_or_create_by({quantity: row[:ingredient_quantity], unit: row[:ingredient_unit],
    recipe_id: recipe.id, component_id: component.id})
end
