# frozen_string_literal: true

class EatenFoodsGatherer
  def initialize(user:)
    @user = user
  end

  def foods
    user.foods.eaten
  end

  def count
    foods.size
  end

  private
  attr_reader :user
end
