class RecipesController < ApplicationController

  def index
    if params[:search]
      component_ids = params[:search][:component_ids].reject(&:blank?).map(&:to_i)
      components = Component.find(component_ids)
      recipes_search = RecipeSearch.new(components)
      @recipes = recipes_search.search
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def search
    if params[:search]
      recipe_search = RecipeSearch.new(params[:search][:component_ids])
      @recipes = recipe_search.search
      binding.pry
      redirect_to recipes
    end
  end

end
