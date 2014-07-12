class RecipeSearch

  attr_accessor :components

  def initialize(components)
    @components = components
  end

  def search
    results = [] #array of recipes that can be created with submitted ingredients

    Recipe.all.each do |recipe|
      recipe_components = []

      recipe.ingredients.each do |ingredient|
        recipe_components << ingredient.component
      end

      recipe_components.uniq!

      if recipe_uses_all_components?(recipe_components)
        results << recipe.id
      end
    end

    Recipe.find(results)
  end

  private
  def recipe_uses_all_components?(recipe_components)
    recipe_components.all? do |component|
      components.include?(component)
    end
  end
end
