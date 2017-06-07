# frozen_string_literal: true

class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name, null: false
      t.date :expiration, null: false
      t.timestamps null: false
    end
  end
end
