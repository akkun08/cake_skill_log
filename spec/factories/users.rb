FactoryBot.define do
  factory :user do
    name {'あっくん'}
    email { 'a@com'}
    password {'111aaa'}
    password_confirmation {password}
  end
end