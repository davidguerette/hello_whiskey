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
    category
  end

  factory :component do
    name 'bourbon'
  end


  factory :category do
    name 'whiskey'
  end
end
