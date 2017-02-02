class SessionsController < ApplicationController
  before_filter :save_login_state, only: [:login, :login_attempt]
  skip_before_filter :authenticate_user

  def new
    redirect_to '/auth/google_oauth2'
  end

  def create
    user = User.find_or_create_by!(email: request.env["omniauth.auth"][:info][:email])
    if user
      session[:user_id] = user.id
      session[:token] = request.env["omniauth.auth"][:credentials][:token]
      flash[:notice] = "Wow Welcome again, you logged in as #{user.username}"
      redirect_to food_items_path
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"  
    end
  end

  def destroy
    logout
  end

  def logout
    session[:user_id] = nil
    session[:token] = nil
    redirect_to new_session_path
  end
end
