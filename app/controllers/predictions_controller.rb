class PredictionsController < ApplicationController
  def new
  end

  def create; end

  def edit; end

  def update; end

  def index
    @predictions = Prediction.all
    @series = Series.all
  end

end
