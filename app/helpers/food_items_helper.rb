module FoodItemsHelper
  def freshness_of(food_item)
    expiration = food_item.expiration
    if expiration < Date.today
      'danger'
    elsif expiration < 1.week.from_now
      'warning'
    else
      'success'
    end
  end
end
