# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user

  before_action :authenticate_user

  def current_user
    @current_user ||= session_user
  end

  protected
  def authenticate_user
    redirect_to new_session_path if session[:user_id].blank? || session[:token].blank?
  end

  def clear_session
    session[:user_id] = nil
    session[:token] = nil
  end

  private
  def session_user
    session[:user_id] && User.find_by(id: session[:user_id])
  end
end
