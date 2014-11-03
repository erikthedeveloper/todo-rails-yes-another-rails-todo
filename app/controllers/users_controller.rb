class UsersController < Devise::RegistrationsController
  def index
    @users = User.all
  end

  # Also see DeviseController
end