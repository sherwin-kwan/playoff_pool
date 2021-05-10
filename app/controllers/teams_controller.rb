class TeamsController < ApplicationController
  def index
    @teams = Team.all.sort_by(&:name)
  end

  def show

  end
end
