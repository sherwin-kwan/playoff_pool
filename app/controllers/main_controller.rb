class MainController < ApplicationController

  def index 
    @users = User.all.sort_by(&:rank)
    @CURRENT_ROUND = 1
  end
end
