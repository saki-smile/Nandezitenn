FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.characters(number: 20) }
    association :user
    association :question
  end
end
