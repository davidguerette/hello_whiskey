require 'rails_helper'

feature 'user can search for recipes from ingredients', %Q{
  User is shown recipes based on the ingredients they submit

  As a lover of fine whiskey cocktails
  I want to know what cocktails I can make with the ingredients I already have
  So that I can prepare a drink

  *******Acceptance Criteria*****************************

  - When I visit the site’s home page, I am shown a list of all recipe ingredients sorted by ingredient category
  - I can select and submit one or more ingredients. I am then taken to an index of recipes that can be created
    using those ingredients
} do

    scenario 'user sees all ingredient component name checkboxes sorted by category' do
      category = Category.first
      category_components = category.components

      visit root_path
      expect(page).to have_content(category.name)
      category_components.each do |category_component|
        expect(page).to have_content(category_component.name)
      end
    end

    scenario 'user selects multiple ingredients and the correct recipes are returned' do
      category = Category.first

      visit root_path
      fill_in

    end

    scenario 'user does not select any ingredients'

end
