class ItemsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @items = Item
    @items = @items.where("project_id = ?", params[:project_id]) if params[:project_id]
    @items = @items.all
  end

  def show
    @project = Project.find(params[:project_id])
    @item = Item.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @item = Item.new
    @item.project_id = params[:project_id]
    @projects = Project.all
  end

  def edit
    @project = Project.find(params[:project_id])
    @item = Item.find(params[:id])
    @projects = Project.all
  end

  def create
    @project = Project.find(params[:project_id])
    @item = Item.create(params[:item])
    if @item.id
      redirect_to project_item_path(@project, @item)
    else
      @projects = Project.all
      render :new
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to project_item_path(@project, @item)
    else
      @projects = Project.all
      render :edit
    end
  end

  def batch_update
    params[:items].each do |item_id, status|
      Item.find(item_id).update_attributes(status)
    end
    redirect_to :back
  end

end
