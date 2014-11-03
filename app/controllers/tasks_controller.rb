class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.where(created_by: params[:user_id]).find(params[:id])
  end

  def new
    @user = User.find params[:user_id]
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task
      redirect_to user_task_path(task_params[:created_by], @task)
    else
      redirect_to new_user_task_path(task_params[:created_by])
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :created_by, :assigned_to)
  end
end
