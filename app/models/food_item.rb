class FoodItem < ActiveRecord::Base
  validates :name, presence: true
  validates :expiration, presence: true

  belongs_to :user

  scope :eaten,       -> { where.not(eaten_on: nil) }
  scope :trashed,     -> { where.not(trashed_on: nil) }
  scope :expiring,    -> { not_trashed.not_eaten }
  scope :not_eaten,   -> { where(eaten_on: nil) }
  scope :not_trashed, -> { where(trashed_on: nil) }

  def trashed?
    trashed_on.present?
  end

  def eaten?
    eaten_on.present?
  end

  def throw_out
    update(trashed_on: Date.today)
  end

  def finish_eating
    update(eaten_on: Date.today)
  end
end
