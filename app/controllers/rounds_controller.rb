class RoundsController < ApplicationController

  def show
    @rounds = Round.all.select([:id, :fancy_name])
    @round = Round.find(params[:id])
    @series = @round.series.includes(:team1).includes(:team2).includes(:winner)
    @predictions = @series.map{|ser| ser.predictions.includes(:winner)}.flatten
    @users_with_picks = User.find(self.users_with_picks.map{|h| h["id"]})
  end

  def users_with_picks
    ActiveRecord::Base.connection.execute("SELECT DISTINCT users.id FROM users JOIN predictions ON users.id = predictions.user_id").to_a
  end
end