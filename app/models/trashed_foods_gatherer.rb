# frozen_string_literal: true

class TrashedFoodsGatherer
  def initialize(user:)
    @user = user
  end

  def foods
    user.foods.trashed
  end

  def count
    foods.count
  end

  private
  attr_reader :user
end
