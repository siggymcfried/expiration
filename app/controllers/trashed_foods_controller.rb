# frozen_string_literal: true

class TrashedFoodsController < ApplicationController
  def update
    current_user.foods.find(params[:id]).throw_out!
    redirect_to foods_path
  end
end
