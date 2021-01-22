FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 10) }
    # image { File.open("#{Rails.root}/spec/fixtures/img/sky.lpg") }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    introduction { Faker::Lorem.characters(number: 20) }
    is_active { true }
    admin { false }
  end
end