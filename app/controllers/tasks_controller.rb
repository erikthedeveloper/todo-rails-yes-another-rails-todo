class TasksController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    redirect_to user_path params[:user_id]
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @users = User.all
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task
    else
      render action: :edit
    end
  end

  def new
    @users = User.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.created_by = current_user.id
    if @task.save
      redirect_to @task
    else
      render action: :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to users_path
  end
  private

  def task_params
    params.require(:task).permit(:title, :description, :created_by, :assigned_to, :image)
  end
end
