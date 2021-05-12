class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    # If the db query fails, ActiveRecord does not throw an error, but instead the "save" method returns false.
    # So, put a condition to handle the error.
    if @user.save
      session[:current_user] = @user.id
      redirect_to :root
    else
      redirect_to :new_user, flash: { original_name: @user.name, original_given_name: @user.given_name, original_email: @user.email,
                           errors: @user.errors.full_messages }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to :edit_user, flash: { errors: ["Your profile has been updated!"]}
    else
      redirect_to :edit_user, flash: {name: @user.name, given_name: @user.given_name, email: @user.email, errors: @user.errors.full_messages }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :given_name, :email, :password, :password_confirmation)
  end
end
