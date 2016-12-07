class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:create, :new]

  # login page
  def new
    render :new
  end

  # login user
  def create
    user = User.find_by_credentials(session_params[:username], session_params[:password])

    if user.nil?
      #flash.now
      render :new
    else
      login_user(user)
      redirect_to cats_url
    end
  end

  # logout user
  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_session_url
    end
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end

  def logged_in_redirect
    redirect_to cats_url if current_user
  end
end
