# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: /\A@\z/
  validates :provider, :uid, :first_name, :last_name, :token, :oauth_expires_at, presence: true

  scope :with_expired_or_expiring_food, -> { joins(:foods).merge(Food.expiring_by(1.week.from_now).not_eaten.not_trashed) }

  has_many :foods, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
