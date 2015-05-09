class AllFoodItemsGatherer
  def initialize(user:)
    @user = user
  end

  def food_items
    user.food_items
  end

  def count
    food_items.count
  end

  private
  attr_reader :user
end
