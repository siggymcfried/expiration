# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def new
    redirect_to '/auth/google'
  end

  def create
    user = GoogleOauthUser.new(request.env['omniauth.auth']).update_or_create
    session[:user_id] = user.id
    redirect_to foods_path
  end

  def destroy
    logout
  end

  def logout
    clear_session
    redirect_to new_session_path
  end
end
