class ExpiringFoodItemsGatherer
  def initialize(user:)
    @user = user
  end

  def food_items
    user.food_items.expiring
  end

  private
  attr_reader :user
end
