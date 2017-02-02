class UsersController < ApplicationController
  def edit
  end

  def destroy
    current_user.destroy
    clear_session
    redirect_to root_path
  end
end
