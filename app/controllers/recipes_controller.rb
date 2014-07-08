class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    # @ingredients = @recipe.ingredients
    binding.pry
  end
end
