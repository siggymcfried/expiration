class EatenFoodItemsGatherer
  def initialize(user:)
    @user = user
  end

  def food_items
    user.food_items.eaten.order(expiration: :asc)
  end

  private
  attr_reader :user
end
