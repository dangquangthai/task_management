FactoryBot.define do
  factory :task do
    user
    description { Faker::Lorem.paragraph_by_chars(number: 40, supplemental: false) }
  end
end
