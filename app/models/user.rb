class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, format: /@/
  validates :password, length: { in: 6..72 }, confirmation: true

  has_many :food_items

  def self.authenticate(username_or_email:, password:)
    user_by_username_or_email(username_or_email).authenticate(password) 
  end

  private
  def self.user_by_username_or_email(username_or_email)
    User.find_by(email: username_or_email) ||
      User.find_by(username: username_or_email) ||
      NullUser.new
  end
end
