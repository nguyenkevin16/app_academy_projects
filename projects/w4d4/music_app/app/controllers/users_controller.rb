class UsersController < ApplicationController

  # Form for creating a new user
  def new
    render :new
  end

  # Takes in params from form and creates new user
  def create
    @user = User.new(user_params)

    if @user.save
      # flash[:messages] = "Welcome Back"
      log_in!(@user)
      # redirect_to
    else
      # flash.now[:messages] = "Invalid "
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
