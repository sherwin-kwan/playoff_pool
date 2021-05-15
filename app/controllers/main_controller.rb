class MainController < ApplicationController

  def index 
    @users = User.all.filter(&:has_picks?).sort_by(&:rank)
    @CURRENT_ROUND = 1
  end
end
