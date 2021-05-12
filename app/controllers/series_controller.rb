class SeriesController < ApplicationController
  def index
    p Series.all.map(&:active?)
    @series = Series.all.filter(&:active?)
    puts "THERE ARE #{@series.count.to_s} series"
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
    puts "Not implemented yet, wait a minute please"
  end

  def destroy
    puts "Can't destroy, suckers!"
  end

  private

  def series_params
    params.require(:series).permit(:team1_id, :team2_id, :round_id)
  end
end
