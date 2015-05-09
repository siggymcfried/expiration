class FoodItemsController < ApplicationController
  def index
    params[:status] ||= 'expiring'
    @food_items = FoodItemsGatherer.new(user: current_user, status: params[:status]).food_items
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

  def edit
    @food_item = current_user.food_items.find(params[:id])
  end

  def update
    @food_item = current_user.food_items.find(params[:id])
    if @food_item.update(food_item_update_params)
      redirect_to food_items_path
    else
      render :edit
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
      flash[:success] = 'Food Item Eaten'
    else
      flash[:error] = 'Food Item Not Eaten'
    end
    redirect_to food_items_path
  end

  private
  def food_item_create_params
    params.require(:food_item).permit(:name, :expiration)
  end

  def food_item_update_params
    params.require(:food_item).permit(:name, :expiration, :eaten_on, :trashed_on)
  end
end
