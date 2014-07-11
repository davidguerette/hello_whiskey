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
      recipe = FactoryGirl.create(:recipe_with_ingredients)
      other_recipe = FactoryGirl.create(:recipe_with_ingredients)
      components = recipe.components
      categories = Category.all

      visit root_path
      click_link 'What Can I Make?'

      categories.each do |category|
        within ".#{category.name.gsub(" ", "-")}" do
          category.components.each do |component|
            expect(page).to have_content(component.name)
          end
        end
      end

    end

    scenario 'user selects multiple ingredients and the correct recipes are returned' do
      recipe = FactoryGirl.create(:recipe_with_ingredients)
      other_recipe = FactoryGirl.create(:recipe_with_ingredients)
      components = recipe.components
      categories = Category.all

      visit root_path
      click_link 'What Can I Make?'
      categories.each do |category|
        within ".#{category.name.gsub(" ", "-")}" do
          category.components.each do |component|
            check(component.name)
          end
        end
      end

      click_button("That's the spirit!")
      expect(page).to have_content(recipe.name)

    end

    scenario 'user does not select any ingredients' do
      recipe = FactoryGirl.create(:recipe_with_ingredients)
      other_recipe = FactoryGirl.create(:recipe_with_ingredients)
      components = recipe.components
      categories = Category.all

      visit root_path
      click_link 'What Can I Make?'

      click_button("That's the spirit!")
      expect(page).to have_content "We can't make a drink without any ingredients! Please select some ingredients and try again."

    end

end
