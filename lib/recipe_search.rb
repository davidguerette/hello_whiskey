class RecipeSearch

  attr_accessor :component_ids

  def initialize(component_ids)
    component_ids = component_ids.delete_if{|x| x==""}
    @component_ids = component_ids
  end

  def search
    results = [] #array of recipes that can be created with submitted ingredients

    Recipe.all.each do |recipe|
      recipe_component_ids =[]
      recipe.ingredients.each do |ingredient|
        recipe_component_ids << ingredient.component_id
      end

      recipe_component_ids = recipe_component_ids.uniq

      if recipe_component_ids.all? { |x| component_ids.map {|y| y.to_i}.include?(x)}
        results << recipe.id
      end
    end
    Recipe.find(results)
  end

end
