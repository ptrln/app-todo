class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.team_id = params[:team_id]
    @teams = Team.all
  end

  def create
    @project = Project.create(params[:project])
    if @project.id
      redirect_to project_path(@project)
    else
      @teams = Team.all
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    @teams = Team.all
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to project_path(@project)
    else
      @teams = Team.all
      render :edit
    end
  end

  def batch_update
    p params
  end

end
