# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user

  before_action :authenticate_user, unless: :already_authenticated?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  protected
  def authenticate_user
    clear_session
    redirect_to new_sessions_path
  end

  def already_authenticated?
    current_user&.oauth_expires_at&.> Time.now.utc
  end

  def clear_session
    session[:user_id] = nil
  end
end
