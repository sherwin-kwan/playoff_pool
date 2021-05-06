class PredictionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @round = Round.find(params[:id])
  end

  # Note: Data is submitted through HTTP for this method
  def create
    p params
    puts "CREATING"
    render plain: "OK"
  end

  def edit; end

  def update; end

  def index
    @predictions = Prediction.all
    @series = Series.all
  end

end
