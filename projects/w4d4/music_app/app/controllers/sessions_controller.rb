class SessionsController < ApplicationController

  # log in form
  def new
    render :new
  end

  # log user in
  def create
    # validate credentials
    @user = User.find_by_credentials(session_params[:email], session_params[:password])

    if @user.nil?
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    else
      log_in!(@user)
      redirect_to user_url(@user)
    end
  end

  # log user out
  def destroy
    log_out if logged_in?
    redirect_to new_sessions_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
