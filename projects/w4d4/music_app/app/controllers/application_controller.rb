class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def log_in!(user)
    new_session_token = user.reset_session_token!
    session[:session_token] = new_session_token
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
    current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !session[:session_token].nil?
  end

  def not_logged_in_redirect
    unless logged_in?
      redirect_to new_sessions_url
    end
  end
end
