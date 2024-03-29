class UsersController < ApplicationController
  def index
    @users = case params[:order]
    when 'a-z' then User.order("name")
    when 'z-a' then User.order("name DESC")
    when 'newest' then User.order("created_at DESC")
    when 'oldest' then  User.order("created_at ASC")
    else User
    end
    @users = @users.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @selected_team = params[:team_id].to_i
    @teams = Team.all
  end

  def create
    @user = User.create(params[:user])
    if @user.id
      redirect_to user_path(@user)
    else
      @teams = Team.all
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @teams = Team.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
      @teams = Team.all
      render :edit
    end
  end
end
