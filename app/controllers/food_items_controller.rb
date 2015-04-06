class FoodItemsController < ApplicationController
  def index
    @food_items = current_user.food_items.order(expiration: :asc)
  end

  def new
    @food_item = current_user.food_items.new
  end

  def create
    @food_item = current_user.food_items.new(food_item_create_params)
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
