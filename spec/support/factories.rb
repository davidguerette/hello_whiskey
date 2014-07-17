FactoryGirl.define do
  factory :recipe do
    sequence(:name) { |n| "Brighton Punch #{n}" }
    directions 'Shake first five ingredients with ice and pour with ice into Collins glass.
      Fill with soda water and stir gently. Garnish with orange and lemon and serve with a straw.'

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
    category
    sequence(:name) { |n| "component #{n}" }
  end

  factory :category do
    sequence(:name) { |n| "whiskey #{n}"}
  end

 factory :user do
    first_name 'Bob'
    last_name 'Smith'
    password 'password123'
    password_confirmation 'password123'
    email 'test@example.com'
  end
end
