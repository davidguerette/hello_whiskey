require 'rails_helper'

feature 'user can view a list of cocktail recipes' do

  scenario 'user can successfully view a list of all cocktail recipes' do
    recipe = FactoryGirl.create(:recipe)
binding.pry
    visit root_path
    click_on 'All Drinks'

    expect(page).to have_content('All Drinks')
    expect(page).to have_content(recipe.name)
  end
end
