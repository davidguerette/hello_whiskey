require 'recipe_search'

class RecipesController < ApplicationController

  def index
    if params[:search]
      recipes_search = RecipeSearch.new(params[:search][:component_ids])
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
