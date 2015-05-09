class AllFoodItemsGatherer
  def initialize(user:)
    @user = user
  end

  def food_items
    user.food_items
  end

  private
  attr_reader :user
end
