FactoryBot.define do
  factory :round do
    round { 1 }
    base_score { 1 }

    trait :later_round do
      round { 3 }
      base_score { 2 }
    end
  end
end