class PredictionsController < ApplicationController
  before_action :validate_user, only: [:new, :new_by_round]

  def new_by_round
    @round = Round.find(params[:id])
  end

  def new
    @prediction = Series.find(params[:id]).predictions.new
    @team1 = @prediction.series.team1
    @team2 = @prediction.series.team2
  end

  # Note: Data is submitted through HTTP for this method
  def create
    first_prediction = Prediction.where(user_id: self.current_user).where(series_id: params[:id]).first
    update(first_prediction) and return if first_prediction
    @prediction = Series.find(params[:id]).predictions.new(predictions_params)
    @prediction.user = self.current_user
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

  def update(prediction)
    if prediction.update(predictions_params)
      redirect_to new_prediction_path(id: prediction.series_id), flash: { winner_id: prediction.winner_id, games: prediction.games,
        errors: ["Your pick of #{prediction.winner.short_name} in #{prediction.games} has been submitted. Thank you!"]}
    else
      redirect_to new_prediction_path(id: prediction.series_id), flash: { winner_id: prediction.winner_id, games: prediction.games,
                           errors: prediction.errors.full_messages }
    end
  end

  def index
    @predictions = Prediction.all.filter(&:active?)
    @series = Series.all
  end

  private

  def predictions_params
    params.require(:prediction).permit(:winner_id, :games)
  end

  def validate_user
    unless session[:current_user]
      session[:target_page] = request.url
      puts "Target is " + session[:target_page]
      redirect_to :login 
    end
  end

end
