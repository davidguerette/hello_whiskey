require 'rails_helper'

feature 'user can view a list of cocktail recipes', %Q{
  As a lover of fine whiskey cocktails
  I want to browse through cocktail recipes
  So that I can find a drink I’d like to make

  *******Acceptance Criteria*****************************

  -I can visit an index page that lists 10 recipes at a time
  -I can visit a unique page for each recipe
  -Each recipe page show the recipe’s components, directions, substitutions
} do

  scenario 'user can successfully view a list of all cocktail recipes' do
    recipe = FactoryGirl.create(:recipe_with_ingredients)
    other_recipe = FactoryGirl.create(:recipe_with_ingredients)

    visit root_path
    click_link 'Browse'

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(other_recipe.name)
  end

  scenario 'user can view all details for an individual cocktail' do
    recipe = FactoryGirl.create(:recipe_with_ingredients)

    visit root_path
    click_link 'Browse'
    click_link recipe.name

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.directions)
    recipe.ingredients.each do |ingredient|
      expect(page).to have_content(ingredient.component.name)
    end
  end
end
