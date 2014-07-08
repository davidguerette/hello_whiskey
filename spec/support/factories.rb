FactoryGirl.define do
  factory :recipe do
    name 'Manhattan'
    directions 'Stir with ice and strain into chilled cocktail glass. Garnish with cherry.'

    factory :recipe_with_ingredients do
      ignore do
        ingredients_count 5
      end

      after(:create) do |recipe, evaluator|
        create_list(:ingredient, evaluator.ingredients_count, recipe: recipe)
      end
    end
  end

  factory :ingredient do
    quantity 2.0
    unit 'oz'

    component
    recipe
  end

  factory :component do
    name 'bourbon'
  end
end
# ['2 oz rye or bourbon whiskey', '0.5 oz sweet vermouth', '1 dash Angustora bitters', '1 maraschino cherry']
