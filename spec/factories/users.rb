FactoryBot.define do
  factory :user do
    user_name                    { Faker::Name.name }
    email                        { Faker::Internet.email }
    password                     { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation        { password }
  end
end
