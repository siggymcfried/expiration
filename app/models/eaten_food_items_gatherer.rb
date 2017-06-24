# frozen_string_literal: true

class EatenFoodItemsGatherer
  def initialize(user:)
    @user = user
  end

  def foods
    user.foods.eaten
  end

  def count
    foods.count
  end

  private
  attr_reader :user
end
