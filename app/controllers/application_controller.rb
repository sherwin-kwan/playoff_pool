class ApplicationController < ActionController::Base

  helper_method :current_round, :validate_user

  def current_round
    3
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
