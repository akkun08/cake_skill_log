FactoryBot.define do
  factory :skill do
    name { "ショートケーキ"}
    category_id { 2 }
    formulation_text { "生クリーム３００g"}
    recipe_text { "生クリームを絞る" }
    
    association :user

    after(:build) do |skill|
      skill.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
