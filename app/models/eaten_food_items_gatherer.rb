class EatenFoodItemsGatherer
  def initialize(user:)
    @user = user
  end

  def food_items
    user.food_items.eaten
  end

  def count
    food_items.count
  end

  private
  attr_reader :user
end
