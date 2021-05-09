class ApplicationController < ActionController::Base

  def current_user
    User.find(session[:current_user])
  end

  def clear_errors
    flash[:errors] = nil
  end
end
