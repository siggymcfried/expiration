class TrashedFoodItemsGatherer
  def initialize(user:)
    @user = user
  end

  def food_items
    user.food_items.trashed
  end

  private
  attr_reader :user
end
