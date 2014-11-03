class UsersController < Devise::RegistrationsController

  before_action :set_users

  before_action :set_user, only: :show

  def index
    @users = User.all
    @tasks = Task.all
  end

  def show

  end

  private

    def set_users
      @users = User.includes(:tasks).all
    end

    def set_user
      @user = User.includes(:tasks).find(params[:id])
    end
  # Also see DeviseController
end