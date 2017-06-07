# frozen_string_literal: true

FactoryGirl.define do
  factory :food_item do
    name 'tasty treat'
    expiration Date.tomorrow
  end
end
