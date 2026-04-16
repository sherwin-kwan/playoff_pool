FactoryBot.define do
  factory :user do
    name { "Joey Zhang" }
    sequence(:email){|n| "user#{n}@factory.com" }
    password { "abcdefg" }
    password_confirmation { "abcdefg" }

    trait :oauth_user do
      provider { 'google_oauth2' }
      uid      { '123456' }
      password { nil }
      password_confirmation { nil }
    end
  end
end