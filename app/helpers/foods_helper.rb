# frozen_string_literal: true

module FoodsHelper
  def freshness_of(food)
    expiration = food.expiration
    if expiration < Time.now.utc.to_date
      'danger'
    elsif expiration < 1.week.from_now
      'warning'
    else
      'success'
    end
  end
end
