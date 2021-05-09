class PredictionsController < ApplicationController
  before_action :validate_user, only: [:new, :new_by_round]

  def new_by_round
    @round = Round.find(params[:id])
  end

  def new
    @prediction = Series.find(params[:id]).predictions.new
  end

  # Note: Data is submitted through HTTP for this method
  def create
    @prediction = Series.find(params[:id]).predictions.new(predictions_params)
    @prediction.user = self.current_user
    # If the db query fails, ActiveRecord does not throw an error, but instead the "save" method returns false.
    # So, put a condition to handle the error.
    if @prediction.save
      redirect_to new_prediction_path(id: @prediction.series_id), flash: { winner_id: @prediction.winner_id, games: @prediction.games,
        errors: ["Your pick of #{@prediction.winner.short_name} in #{@prediction.games} has been submitted. Thank you!"]}
    else
      redirect_to new_prediction_path(id: @prediction.series_id), flash: { winner_id: @prediction.winner_id, games: @prediction.games,
                           errors: @prediction.errors.full_messages }
    end

  end

  def create_by_round
    p params
    puts "Creating ... by round"
    render plain: "OK"
  end

  def edit; end

  def update; end

  def index
    @predictions = Prediction.all
    @series = Series.all
  end


  private

  def predictions_params
    params.require(:prediction).permit(:winner_id, :games)
  end

  def validate_user
    redirect_to :new_user unless session[:current_user]
  end

end
