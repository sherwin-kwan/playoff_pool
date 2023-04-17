class ApplicationController < ActionController::Base

  before_action :set_variables

  def set_variables
    @current_round = ENV["CURRENT_ROUND"].to_i || 1
    @current_year = ENV["CURRENT_YEAR"].to_i || Time.now.year
  end

  def current_user
    User.find(session[:current_user])
  end


  def clear_errors
    flash[:errors] = nil
  end

  def validate_user
    if session[:current_user]
      return true
    else
      session[:target_page] = request.url
      puts "Target is " + session[:target_page]
      redirect_to :login and return
    end
  end
end
