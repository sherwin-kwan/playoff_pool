FactoryBot.define do
  factory :prediction do
    games { 4 }
    winner { FactoryBot.create(:team) }
    user { FactoryBot.create(:user) }
    series { FactoryBot.create(:series) }
  end
end