class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user: current_user)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    favorite = Favorite.new(recipe_id: params[:recipe_id], user_id: current_user.id)

    if favorite.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to back(@recipe)
    end
  end
end
