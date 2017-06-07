# frozen_string_literal: true

class AddUserIdToFoodItem < ActiveRecord::Migration
  def change
    add_column :food_items, :user_id, :integer, null: false
  end
end
