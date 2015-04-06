class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  before_filter :authenticate_user

  def current_user
    @current_user ||= session_user || no_user
  end

  protected 
  def authenticate_user
    if session[:user_id]
       # set current user object to @current_user object variable
      @current_user = User.find session[:user_id] 
      true 
    else
      redirect_to sessions_login_path
      false
    end
  end
  
  def save_login_state
    if session[:user_id]
      redirect_to food_items_path
      false
    else
      true
    end
  end

  private
  def session_user
    session[:user_id] && User.find_by(id: session[:user_id])
  end

  def no_user
    NullUser.new
  end
end
