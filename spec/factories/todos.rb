FactoryGirl.define do
  factory :todo do
    title { Faker::Dessert.flavor }
    created_by { Faker::Number.number(10) }
  end
end
