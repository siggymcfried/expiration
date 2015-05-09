class AllFoodItemsGatherer
  def initialize(user:)
    @user = user
  end

  def food_items
    user.food_items.order(expiration: :asc)
  end

  private
  attr_reader :user
end
