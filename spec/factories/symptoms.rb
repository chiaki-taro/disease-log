FactoryBot.define do
  factory :symptom do
    association :disease

    symptoms      { "咳" }
    time          { Faker::Time.between(from: DateTime.now - 7, to: DateTime.now) }
    level_id      { Faker::Number.between(from: 1, to: 6) }
    treatment     { "薬を飲んだ" }
    evaluation    { "薬の効果はあった" }
    memo          { "薬で眠くなった" }
  end
end
