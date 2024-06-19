FactoryBot.define do
  factory :disease do
    association :patient

    disease_name      { Faker::Name.name }
    date_of_onset     { Faker::Time.between(from: DateTime.now - 7, to: DateTime.now) }
    status_id         { Faker::Number.between(from: 1, to: 2) }
  end
end
