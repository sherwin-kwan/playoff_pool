class ResultsController < ApplicationController
  def show
    @year = params[:year].to_i
    @users = Result.where(year: @year).map{|res| res.user}.sort_by{|user| user.rank(@year)}
  end
end
