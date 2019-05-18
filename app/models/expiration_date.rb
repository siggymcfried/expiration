# frozen_string_literal: true

class ExpirationDate
  def initialize(food_name)
    @food_name = food_name
  end

  def calculate
    last_similar_food.expiration_length.from_now.to_date
  end

  private

  attr_reader :food_name

  def last_similar_food
    Food.where(name: food_name).order(created_at: :desc).first || NullFood.new
  end
end
