class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:username], user_params[:password])

    if user
      log_in(user)
      redirect new_sessions_url
    else
      flash.now[:errors] = ["Not valid username/password"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_sessions_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
