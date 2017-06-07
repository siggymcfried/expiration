# frozen_string_literal: true

class UpdateFoodItemEatenAndThrownOutOn < ActiveRecord::Migration
  def change
    change_table :food_items do |t|
      t.rename :finished_eating_on, :eaten_on
      t.rename :thrown_out_on,      :trashed_on
    end
  end
end
