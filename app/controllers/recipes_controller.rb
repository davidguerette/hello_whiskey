class RecipesController < ApplicationController

  def index
    if params[:search]
      @recipe_search = RecipeSearch.new(params[:search])
      @recipes = @recipe_search.search
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    # @ingredients = @recipe.ingredients
  end

  def home
    @categories = Category.all
  end

  def search
    #return a drink based on input ingredients
    redirect_to root_path
  end

end
