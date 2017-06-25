# frozen_string_literal: true

FactoryGirl.define do
  factory :food do
    sequence :name do |n|
      "tasty treat #{n}"
    end
    expiration Date.tomorrow
    user

    trait :expired do
      expiration Date.yesterday
    end

    trait :expiring do
      expiration Date.tomorrow
    end

    trait :eaten do
      eaten_on Date.yesterday
    end

    trait :trashed do
      trashed_on Date.yesterday
    end
  end
end
