class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= session_user || no_user
  end

  private
  def session_user
    session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def no_user
    NullUser.new
  end
end
