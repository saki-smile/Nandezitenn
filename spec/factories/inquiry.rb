FactoryBot.define do
  factory :inquiry do
    name { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    message { Faker::Lorem.characters(number: 20) }
  end
end
