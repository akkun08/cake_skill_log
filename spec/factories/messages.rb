FactoryBot.define do
  factory :message do
    content {"ありがとう"}
    
    association :user
    association :room
  end
end
