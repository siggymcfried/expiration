# frozen_string_literal: true

class ExpiringFoodsGatherer
  def initialize(user:)
    @user = user
  end

  def foods
    user.foods.expiring
  end

  def count
    foods.size
  end

  private
  attr_reader :user
end
