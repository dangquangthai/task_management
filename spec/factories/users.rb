FactoryBot.define do
  factory :user do
    username                     { Faker::Internet.user_name }
    password                     { '12345678' }
    password_confirmation        { '12345678' }
  end
end
