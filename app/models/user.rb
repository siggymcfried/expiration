# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: /@/

  scope :with_expired_or_expiring_food, -> { joins(:foods).merge(FoodItem.expiring_by(1.week.from_now).not_eaten.not_trashed) }

  has_many :foods, dependent: :destroy
end
