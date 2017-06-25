# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: /@/
  validates :provider, :uid, :first_name, :last_name, :token, :refresh_token, :oauth_expires_at, presence: true

  scope :with_expired_or_expiring_food, -> { joins(:foods).merge(Food.expiring_by(1.week.from_now).not_eaten.not_trashed) }

  has_many :foods, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
