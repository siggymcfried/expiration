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

  def throw_out
    food_item = current_user.food_items.find(params[:food_item_id])
    if food_item.throw_out
      flash[:success] = 'Food Item Thrown Out'
    else
      flash[:error] = 'Food Item Not Thrown Out'
    end
    redirect_to food_items_path
  end

  def finish_eating
    food_item = current_user.food_items.find(params[:food_item_id])
    if food_item.finish_eating
      flash[:success] = 'Food Item Thrown Out'
    else
      flash[:error] = 'Food Item Not Thrown Out'
    end
    redirect_to food_items_path
  end

  private
  def food_item_create_params
    params.require(:food_item).permit(:name, :expiration)
  end
end
