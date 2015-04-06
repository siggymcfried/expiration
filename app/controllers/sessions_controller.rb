class SessionsController < ApplicationController
  before_filter :save_login_state, only: [:login, :login_attempt]
  skip_before_filter :authenticate_user

  def login
  end

  def login_attempt
    authorized_user = User.authenticate(username_or_email: params[:username_or_email], password: params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to food_items_path
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"  
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to sessions_login_path
  end
end
