FactoryBot.define do
  factory :comment do
    text { "いい感じですね"}

    association :user
    association :skill
  end
end
