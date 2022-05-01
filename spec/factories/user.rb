FactoryBot.define do
  factory :user do
    name { "Joey Zhang" }
    sequence(:email){|n| "user#{n}@factory.com" }
    password { "abcdefg" }
    password_confirmation { "abcdefg" }
  end
end