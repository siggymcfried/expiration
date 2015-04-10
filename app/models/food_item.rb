class FoodItem < ActiveRecord::Base
  validates :name, presence: true
  validates :expiration, presence: true

  belongs_to :user

  def throw_out
    update(thrown_out_on: Date.today)
  end

  def finish_eating
    update(finished_eating_on: Date.today)
  end
end
