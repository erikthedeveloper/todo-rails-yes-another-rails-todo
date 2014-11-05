class TasksController < ApplicationController

  # TODO: Validate logged in to create/edit tasks...

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
    @user = User.find params[:user_id]
    @task = Task.new(task_params)
    if @task.save
      redirect_to user_task_path(task_params[:created_by], @task)
    else
      # redirect_to new_user_task_path(task_params[:created_by]), flash: {errors: @task.errors}
      render action: :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :created_by, :assigned_to)
  end
end
