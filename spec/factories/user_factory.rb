# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    uid { 'asd' }
    first_name { 'Michael' }
    last_name { 'Siegfried' }
    provider { :google }
    token { '123456' }
    oauth_expires_at { 2.days.from_now }
  end
end
