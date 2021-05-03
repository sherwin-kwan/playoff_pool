# spec/models/team_spec.rb

require "rails_helper"

RSpec.describe Team, :type => :model do
  # just to check that seeds worked properly
  fixtures :teams
  fixtures :series

  context "2019 playoffs" do
    it "should total 16 teams" do
      expect(Team.all.count).to eq(16)
    end

    it "should load joins properly" do
      expect(series(:series1).team1.name).to eq("Tampa Bay Lightning")
    end
  end
end
