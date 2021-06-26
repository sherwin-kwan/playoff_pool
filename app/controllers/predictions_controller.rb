class PredictionsController < ApplicationController
  before_action :validate_user, only: [:new, :new_by_round]

  def new_by_round
    @round = Round.find(params[:id])
  end

  def new
    @prediction = Series.find(params[:id]).predictions.new
    @team1 = @prediction.series.team1
    @team2 = @prediction.series.team2
    @round_id = @prediction.series.round_id
    if @round_id == 4
      @players = Player.where("team_id = #{@team1.id} OR team_id = #{@team2.id}").sort_by(&:last_name)
    end
  end

  # Note: Data is submitted through HTTP for this method
  def create
    first_prediction = Prediction.where(user_id: self.current_user).where(series_id: params[:id]).first
    update(first_prediction) and return if first_prediction
    @prediction = Series.find(params[:id]).predictions.new(predictions_params)
    @prediction.user = self.current_user
    if @prediction.save
      conn_smythe_string = " with #{@prediction.conn_smythe.last_name} as the Conn Smythe winner" if @prediction.conn_smythe_id
      redirect_to new_prediction_path(id: @prediction.series_id), flash: { winner_id: @prediction.winner_id, games: @prediction.games, conn_smythe_id: @prediction&.conn_smythe&.name,
        errors: ["Your pick of #{@prediction.winner.short_name} in #{@prediction.games}#{conn_smythe_string} has been submitted. Thank you!"]}
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
    if prediction.series.round_id == 4
      redirect_to new_prediction_path(id: prediction.series_id), flash: { winner_id: prediction.winner_id, games: prediction.games, conn_smythe: prediction&.conn_smythe&.name,
        errors: ["ERROR: Sorry, you have already made a pick for the finals, and you cannot change it!"]}
    elsif prediction.update(predictions_params)
      redirect_to new_prediction_path(id: prediction.series_id), flash: { winner_id: prediction.winner_id, games: prediction.games,
        errors: ["Your pick of #{prediction.winner.short_name} in #{prediction.games} has been submitted. Thank you!"]}
    else
      redirect_to new_prediction_path(id: prediction.series_id), flash: { winner_id: prediction.winner_id, games: prediction.games,
        errors: prediction.errors.full_messages }
    end
  end

  def index
    @predictions = Prediction.all
    @series = Series.all
  end

  private

  def predictions_params
    params.require(:prediction).permit(:winner_id, :games, :conn_smythe_id)
  end

end
