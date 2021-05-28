class SeriesController < ApplicationController

  before_action :check_privileges, only: [:edit, :new]

  def index
    @series = Series.all.includes(:team1).includes(:team2).includes(:round).includes(:winner).filter(&:active?).sort_by(&:round_id)
  end

  def new
    @this_series = Series.new 
  end

  def create
    @this_series = Series.new(series_params)
    if @this_series.save 
      redirect_to series_index_path
    else
      redirect_to new_series_path, flash: {errors: @this_series.errors.full_messages}
    end
  end

  def show
    @this_series = Series.find(params[:id])
  end

  def edit
    @this_series = Series.find(params[:id])
  end

  def update
    @this_series = Series.find(params[:id])
    if @this_series.update(series_params)
      redirect_to series_index_path
    else
      redirect_to edit_series_path, flash: {errors: @this_series.errors.full_messages}
    end
  end

  def destroy
    puts "Can't destroy, suckers!"
  end

  private

  def series_params
    params.require(:series).permit(:team1_id, :team2_id, :round_id, :start_time, :year)
  end

  def check_privileges
    unless User.find(session[:current_user]).admin?
      render "application/error", {locals: {message: "You do not have permission to view this page"}} and return
    end
  end
end
