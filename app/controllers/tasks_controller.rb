class TasksController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    redirect_to user_path params[:user_id]
  end

  def show
    @task = Task.where(assigned_to: params[:user_id]).find(params[:id])
  end

  def edit
    @user = User.find params[:user_id]
    @task = Task.where(assigned_to: params[:user_id]).find(params[:id])
  end

  def update
    @user = User.find params[:user_id]
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to user_task_path(params[:user_id], @task)
    else
      render action: :edit
    end
  end

  def new
    @user = User.find params[:user_id]
    @task = Task.new
  end

  def create
    @user = User.find params[:user_id]
    @task = Task.new(task_params)
    if @task.save
      redirect_to user_task_path(task_params[:created_by], @task)
    else
      render action: :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :created_by, :assigned_to, :image)
  end
end
