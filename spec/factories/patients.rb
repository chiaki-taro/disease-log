FactoryBot.define do
  factory :patient do
    association :user

    patient_name      { Faker::Name.name }
    sex_id            { Faker::Number.between(from: 1, to: 3) }
    birthday          { Faker::Date.backward(days: 365 * 100) }
  end
end
