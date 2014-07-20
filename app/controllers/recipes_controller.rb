class RecipesController < ApplicationController

  def index
    if params[:search]
      component_ids = params[:search][:component_ids].reject(&:blank?).map(&:to_i)
      components = Component.find(component_ids)
      recipes_search = RecipeSearch.new(components)
      @recipes = recipes_search.search.order(name: :asc)

      if @recipes.empty?
        flash.now[:notice] = "Sorry, but fine drinks begin with fine ingredients. Please enter more ingredients and try again!"
        render :search
      end
    else
      @recipes = Recipe.all.order(name: :asc)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
