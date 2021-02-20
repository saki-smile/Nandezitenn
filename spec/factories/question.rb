FactoryBot.define do
  factory :question do
    title { Faker::Lorem.characters(number: 5) }
    # image { File.open("#{Rails.root}/spec/fixtures/img/sky.lpg") }
    observation { Faker::Lorem.characters(number: 20) }
    impression { Faker::Lorem.characters(number: 20) }
    realization { Faker::Lorem.characters(number: 20) }
    uncertainty { Faker::Lorem.characters(number: 20) }
    user
    category
  end
end
