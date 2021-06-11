class ApplicationController < ActionController::Base

  helper_method :current_round

  def current_round
    2
  end

  def current_user
    User.find(session[:current_user])
  end

  def clear_errors
    flash[:errors] = nil
  end
end
