class SessionsController < ApplicationController

  def create
    # Call the authenticate_with_email function to check if this email/password pair is valid
    user = User.authenticate_with_email(params[:email], params[:password])
    if user
      session[:current_user] = user.id
      target = session[:target_page]
      session[:target_page] = nil
      redirect_to target || root_path
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to :login, flash: { original_email: params[:email], error: "Username and password do not match" }
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to :root
  end

  def new; end
end
