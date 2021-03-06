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

    scenario 'user selects ingredients from a recipe without optional or substitute ingredients and the correct recipes are returned' do
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

  scenario 'user selects ingredients from a recipe with substitute ingredients and the correct recipes are returned'
  scenario 'user does not select an optional ingredient and the recipe is returned'

    scenario 'user receives error if no recipes can be made with submitted ingredients' do
      recipe = FactoryGirl.create(:recipe_with_ingredients)
      other_recipe = FactoryGirl.create(:recipe_with_ingredients)
      components = recipe.components
      categories = Category.all

      visit root_path
      click_link 'What Can I Make?'

      click_button("That's the spirit!")
      expect(page).to have_content "Sorry, but fine drinks begin with fine ingredients. Please enter more ingredients and try again!"
    end

end
