require 'rails_helper'

RSpec.describe "scoring", :type => :request do

  before(:each) do
    @round = FactoryBot.create(:round)
    @later_round = FactoryBot.create(:round, round: 3, base_score: 2)
    @finals = FactoryBot.create(:round, round: 4, base_score: 2)
    @team1 = FactoryBot.create(:team)    
    @team2 = FactoryBot.create(:team, :hurricanes)
    @mvp = FactoryBot.create(:player)
    @series1 = FactoryBot.create(:series, team1: @team1, team2: @team2, round: @round, winner: @team1, games: 5, start_time: 1.day.from_now)
    @series2 = FactoryBot.create(:series, team1: @team1, team2: @team2, round: @later_round, winner: @team1, games: 7, start_time: 1.day.from_now)
    @series3 = FactoryBot.create(:series, team1: @team1, team2: @team2, round: @finals, winner: @team1, games: 5, conn_smythe: @mvp, start_time: 1.day.from_now)
    @user = FactoryBot.create(:user)
    @request.session[:current_user] = @user
  end

  xit "can create a prediction" do
    post "/series/#{@series1.id}/create_prediction", params: {}
    expect(response.status).to eq(200)
  end



end
