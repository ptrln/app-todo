class TeamsController < ApplicationController
  def index
    @teams = case params[:order]
    when 'a-z' then Team.order("name")
    when 'z-a' then Team.order("name DESC")
    when 'newest' then Team.order("created_at DESC")
    when 'oldest' then  Team.order("created_at ASC")
    else Team
    end
    @teams = @teams.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
    @users = User.all
  end

  def create
    @team = Team.create(params[:team])
    if @team.id
      redirect_to team_path(@team)
    else
      @users = User.all
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
    @users = User.all
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      redirect_to team_path(@team)
    else
      @users = User.all
      render :edit
    end
  end
end
