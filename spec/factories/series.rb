FactoryBot.define do
  factory :series do
    team1 { FactoryBot.create(:team) }
    team2 { FactoryBot.create(:team, :hurricanes)}
    round { FactoryBot.create(:round) }
  end
end