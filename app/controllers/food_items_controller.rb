# frozen_string_literal: true

class FoodItemsController < ApplicationController
  def index
    params[:status] ||= 'expiring'
    gatherer = FoodItemsGatherer.new(user: current_user, status: params[:status], page: params[:page])
    @filters = %w[all eaten expiring trashed]
    @counts = gatherer.counts
    @foods = gatherer.foods
  end

  def new
    @food = current_user.foods.new
  end

  def create
    @food = current_user.foods.new(food_create_params)
    if @food.save
      redirect_to foods_path
    else
      render 'new'
    end
  end

  def edit
    @food = current_user.foods.find(params[:id])
  end

  def update
    @food = current_user.foods.find(params[:id])
    if @food.update(food_update_params)
      redirect_to foods_path
    else
      render :edit
    end
  end

  def throw_out
    food = current_user.foods.find(params[:food_id])
    if food.throw_out
      flash[:success] = 'Food Item Thrown Out'
    else
      flash[:error] = 'Food Item Not Thrown Out'
    end
    redirect_to foods_path
  end

  def finish_eating
    food = current_user.foods.find(params[:food_id])
    if food.finish_eating
      flash[:success] = 'Food Item Eaten'
    else
      flash[:error] = 'Food Item Not Eaten'
    end
    redirect_to foods_path
  end

  private
  def food_create_params
    params.require(:food).permit(:name, :expiration)
  end

  def food_update_params
    params.require(:food).permit(:name, :expiration, :eaten_on, :trashed_on)
  end
end
