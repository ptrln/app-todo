class DashboardController < ApplicationController
  def index
    @projects = Project.all
    @teams = Team.all
    @users = User.all
  end
end
