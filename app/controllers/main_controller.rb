class MainController < ApplicationController

  def index 
    @users = User.all.filter(&:has_picks?).sort_by{|u| u.user_scores.find_by(year: @current_year).score}.reverse!
  end
end
