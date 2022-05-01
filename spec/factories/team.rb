FactoryBot.define do
  factory :team do
    name { "Washington Capitals" }
    short_name { "Capitals" }
    division { FactoryBot.create(:division) }

    trait :hurricanes do
      name { "Carolina Hurricanes" }
      short_name { "Hurricanes" }
      division { FactoryBot.create(:division) }
    end
  end
end