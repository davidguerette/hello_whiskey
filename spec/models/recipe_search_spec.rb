require 'rails_helper'

describe RecipeSearch do
  describe "#search" do
    it "returns recipes that can be made with given components" do
      recipe = FactoryGirl.create(:recipe_with_ingredients)
      other_recipe = FactoryGirl.create(:recipe_with_ingredients)
      components = recipe.components

      recipe_search = RecipeSearch.new(components)
      results = recipe_search.search

      expect(results).to include recipe
      expect(results).to_not include other_recipe
    end
  end
end
