class SeriesController < ApplicationController
  def index
    @series = Series.all
  end

  def new
    @this_series = Series.new
  end

  def create
    puts "Not implemented yet, creating a series"
  end

  def show
    @series = Series.find(params[:id])
  end

  def edit
    @series = Series.find(params[:id])
  end

  def update
    puts "Not implemented yet, wait a minute please"
  end

  def destroy
    puts "Can't destroy, suckers!"
  end
end
