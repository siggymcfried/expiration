# frozen_string_literal: true

module FoodItemsHelper
  def freshness_of(food)
    expiration = food.expiration
    if expiration < Date.today
      'danger'
    elsif expiration < 1.week.from_now
      'warning'
    else
      'success'
    end
  end
end
