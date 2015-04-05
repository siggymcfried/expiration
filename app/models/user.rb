class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true

  def logged_in?
    false
  end
end
