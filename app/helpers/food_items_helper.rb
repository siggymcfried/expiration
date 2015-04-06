module FoodItemsHelper
  def freshness_of(food_item)
    expiration = food_item.expiration
    if expiration < Date.today
      'expired'
    elsif expiration < 1.week.from_now
      'expiring'
    else
      'fresh'
    end
  end
end
