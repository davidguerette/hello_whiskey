require 'rails_helper'

feature 'user can view a list of cocktail recipes' do

  scenario 'user can successfully view a list of all cocktail recipes' do
    recipe = FactoryGirl.create(:recipe)

    visit root_path
    click_link 'All Drinks'

    expect(page).to have_content('All Drinks')
    expect(page).to have_content(recipe.name)
  end

  scenario 'user can view all details for an individual cocktail' do
    recipe = FactoryGirl.create(:recipe)

    visit root_path
    click_on 'All Drinks'
    click_link recipe.name
# save_and_open_page
    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.directions)
    expect(page).to have_content(recipe.ingredients)
  end
end
