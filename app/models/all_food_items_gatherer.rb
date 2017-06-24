# frozen_string_literal: true

class AllFoodItemsGatherer
  def initialize(user:)
    @user = user
  end

  def foods
    user.foods
  end

  def count
    foods.count
  end

  private
  attr_reader :user
end
