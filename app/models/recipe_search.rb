class RecipeSearch
  attr_accessor :components

  def initialize(components)
    @components = components
  end

  def search
    results = []

    Recipe.all.each do |recipe|
      if self.has_all_components_for?(recipe)
        results << recipe
      elsif self.has_substitutions_for?(recipe)
        results << recipe
      end
    end
    results
  end

  protected

  def has_all_components_for?(recipe)
    recipe.ingredients.each do |ingredient|
      if !ingredient.optional
        return false if !components.include?(ingredient.component)
      end
    end
  end

  def has_substitutions_for?(recipe)
    recipe.ingredients.each do |ingredient|
      if !ingredient.optional && !self.has_ingredient_substitutes?(ingredient)
        return false
      end
    end
  end

  def has_ingredient_substitutes?(ingredient)
    substitute_components = []

    ingredient.substitutes.each do |substitute_component|
      if components.include?(substitute_component)
        substitute_components << substitute_component
      end
    end

    unless substitute_components.empty?
      true
    else
      false
    end
  end
end
