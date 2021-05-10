class MainController < ApplicationController

  def index 
    @users = User.all
    @CURRENT_ROUND = 1
  end
end
