FactoryBot.define do
  factory :idea do
    body { "MyText" }
    association :category
  end
end
