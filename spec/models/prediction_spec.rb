require 'rails_helper'

RSpec.describe "scoring" do

  before(:each) do
    @round = FactoryBot.create(:round)
    @later_round = FactoryBot.create(:round, round: 3, base_score: 2)
    @finals = FactoryBot.create(:round, round: 4, base_score: 2)
    @team1 = FactoryBot.create(:team)    
    @team2 = FactoryBot.create(:team, :hurricanes)
    @mvp = FactoryBot.create(:player)
    @series1 = FactoryBot.create(:series, team1: @team1, team2: @team2, round: @round, winner: @team1, games: 5)
    @series2 = FactoryBot.create(:series, team1: @team1, team2: @team2, round: @later_round, winner: @team1, games: 7)
    @series3 = FactoryBot.create(:series, team1: @team1, team2: @team2, round: @finals, winner: @team1, games: 5, conn_smythe: @mvp)
    @user = FactoryBot.create(:user)
  end

  context "scoring" do
    it "should score a point per correct prediction" do
      pred = FactoryBot.create(:prediction, winner: @team1, user: @user, series: @series1, games: 4)
      expect(pred.score).to eq(1)
    end
  
    it "should score 2 points for a correct prediction with games" do
      pred = FactoryBot.create(:prediction, winner: @team1, user: @user, series: @series1, games: 5)
      expect(pred.score).to eq(2)
    end
  
    it "should score nothing for a wrong team prediction, even if games are right" do
      pred = FactoryBot.create(:prediction, winner: @team2, user: @user, series: @series1, games: 5)
      expect(pred.score).to eq(0)
    end
  
    it "should score 2 points for a correct round 3 prediction" do
      pred = FactoryBot.create(:prediction, winner: @team1, user: @user, series: @series2, games: 4)
      expect(pred.score).to eq(2)
    end
  
    it "should score 4 points for a correct round 3 games prediction" do
      pred = FactoryBot.create(:prediction, winner: @team1, user: @user, series: @series2, games: 7)
      expect(pred.score).to eq(4)
    end
  
    it "can't create a round 4 prediction without CS pick" do    
      pred = FactoryBot.build(:prediction, series: @series3, winner: @team1, games: 6)
      expect(pred.save).to eq(false)
    end
  
    it "should score 6 points for a correct round 4 games prediction with Conn Smythe" do
     pred = FactoryBot.create(:prediction, winner: @team1, user: @user, series: @series3, games: 5, conn_smythe: @mvp)
      expect(pred.score).to eq(6)
    end
  
    it 'should not allow duplicate predictions (only edits)' do
      pred = FactoryBot.create(:prediction, winner: @team1, user: @user, series: @series1, games: 5)
      pred2 = FactoryBot.build(:prediction, winner: @team2, user: @user, series: @series1, games: 5)
      expect(pred2.save).to be(false)
    end

    it "should not treat old predictions as valid" do
      pred = FactoryBot.create(:prediction, winner: @team1, user: @user, series: @series1, games: 5)
      pred.update(winner: @team2)
      expect(pred.score).to eq(0)
    end

  end

  context "prediction times" do
    it 'cannot make a prediction once the start time is over' do

    end
  end

end