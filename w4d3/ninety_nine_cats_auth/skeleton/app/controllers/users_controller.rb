class UsersController < ApplicationController
  before_action :logged_in_redirect, only: [:create, :new]

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to cats_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def logged_in_redirect
    if current_user
      flash[:messages] ||= []
      flash[:messages] << "You're already logged in."
      redirect_to cats_url
    end
  end
end
