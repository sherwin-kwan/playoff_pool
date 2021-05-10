class RoundsController < ApplicationController

  def show
    @round = Round.find(params[:id])
    @predictions = Prediction.all.filter{|pred| pred.series.round.id == params[:id]}
    @users_with_picks = User.find(self.users_with_picks.map{|h| h["id"]})
  end

  def users_with_picks
    ActiveRecord::Base.connection.execute("SELECT DISTINCT users.id FROM users JOIN predictions ON users.id = predictions.user_id").to_a
  end
end