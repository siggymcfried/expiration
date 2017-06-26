# frozen_string_literal: true

class EatenFoodsController < ApplicationController
  def update
    current_user.foods.find(params[:id]).finish_eating!
    redirect_to foods_path
  end
end
