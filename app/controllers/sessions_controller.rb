class SessionsController < ApplicationController
  skip_before_filter :authenticate_user

  def new
    redirect_to '/auth/google_oauth2'
  end

  def create
    user = User.find_or_create_by!(email: request.env["omniauth.auth"][:info][:email])
    session[:user_id] = user.id
    session[:token] = request.env["omniauth.auth"][:credentials][:token]
    flash[:notice] = "Wow Welcome again, you logged in as #{user.username}"
    redirect_to food_items_path
  end

  def destroy
    logout
  end

  def logout
    clear_session
    redirect_to new_session_path
  end
end
