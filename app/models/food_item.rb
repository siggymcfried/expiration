class FoodItem < ActiveRecord::Base
  validates :name, presence: true
  validates :expiration, presence: true
end
