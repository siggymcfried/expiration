class FoodItemsController < ApplicationController
  def index
    @food_items = FoodItem.order(expiration: :desc)
  end

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.new(food_item_create_params)
    if @food_item.save
      redirect_to food_items_path
    else
      render 'new'
    end
  end

  private
  def food_item_create_params
    params.require(:food_item).permit(:name, :expiration)
  end
end
