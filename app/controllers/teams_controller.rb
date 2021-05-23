class TeamsController < ApplicationController
  def index
    @teams = Team.all.sort_by(&:name)
  end

  def show
    @team = Team.find(params[:id])
    @schedule = @team.playoff_schedule
  end
end
