# frozen_string_literal: true

class RenameFoodItemsToFoods < ActiveRecord::Migration[5.1]
  def change
    rename_table :food_items, :foods
  end
end
