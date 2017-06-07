# frozen_string_literal: true

class ExpiringFoodItemsGatherer
  def initialize(user:)
    @user = user
  end

  def food_items
    user.food_items.expiring
  end

  def count
    food_items.count
  end

  private
  attr_reader :user
end
