# frozen_string_literal: true

FactoryGirl.define do
  factory :food do
    name 'tasty treat'
    expiration Date.tomorrow
  end
end
