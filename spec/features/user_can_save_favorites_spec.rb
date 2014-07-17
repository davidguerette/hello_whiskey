require 'rails_helper'

feature 'user can save and view their favorite recipes', %Q{

  User can save their favorite recipes

  As a lover of fine whiskey cocktails
  I want to be able to save my favorite whiskey cocktail recipes
  So that I can look them up when I want to make a drink

  *******Acceptance Criteria*****************************

  - If I am logged in I am able to add a recipe to my list of favorites
  - When I log in to my account, I am shown a list of my favorite recipes

  } do

  scenario 'user can add a recipe to their list of favorites' do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe_with_ingredients)

    sign_in_as(user)
    click_link 'Browse'
    click_link recipe.name
    click_link 'Add to favorites'
    click_link 'Favorites'

    expect(page).to have_content(recipe.name)
  end

  scenario 'user sees their favorite recipes when they log in' do
    user = FactoryGirl.create(:user)
    recipe = user.favorites.first

    sign_in_as(user)
    click_link 'Browse'

    expect(page).to have_content('Welcome back!')
    # expect(page).to have_content(recipe.name)
  end
end
