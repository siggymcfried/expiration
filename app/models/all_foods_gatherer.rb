# frozen_string_literal: true

class AllFoodsGatherer
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