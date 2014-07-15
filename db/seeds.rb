CSV.foreach("../holy_grail/db/data/hello_whiskey_test_seeder.csv", headers: true, header_converters: :symbol) do |row|
  row = row.to_hash

  recipe = Recipe.find_or_create_by({name: row[:recipe_name], directions: row[:recipe_directions]})
  category = Category.find_or_create_by({name: row[:category_name]})
  component = Component.find_or_create_by({name: row[:component_name], category_id: category.id})
  ingredient = Ingredient.find_or_create_by({quantity: row[:ingredient_quantity], unit: row[:ingredient_unit],
    recipe_id: recipe.id, component_id: component.id})

  if row[:substitution]
    substitute_ingredient = Component.find_or_create_by({name: row[:substitution], category_id: category.id})
    Substitution.find_or_create_by(ingredient_id: ingredient.id, substitute_id: substitute_ingredient.id)
  end
end
