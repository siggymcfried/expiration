# frozen_string_literal: true

FactoryGirl.define do
  factory :food do
    sequence :name do |n|
      "tasty treat #{n}"
    end
    expiration Date.tomorrow
    user
  end
end
